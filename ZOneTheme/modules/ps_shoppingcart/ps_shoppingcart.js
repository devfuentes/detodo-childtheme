/**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 *  @author   PrestaShop SA <contact@prestashop.com>
 *  @copyright  2007-2016 PrestaShop SA
 *  @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */

/* global $, prestashop */

/**
 * This module exposes an extension point in the form of the `showModal` function.
 *
 * If you want to override the way the modal window is displayed, simply define:
 *
 * prestashop.blockcart = prestashop.blockcart || {};
 * prestashop.blockcart.showModal = function myOwnShowModal (modalHTML) {
 *   // your own code
 *   // please not that it is your responsibility to handle closing the modal too
 * };
 *
 * Attention: your "override" JS needs to be included **before** this file.
 * The safest way to do so is to place your "override" inside the theme's main JS file.
 *
 */

$(window).load(function() {
  prestashop.blockcart = prestashop.blockcart || {};

  var showModal = prestashop.blockcart.showModal || function (modal) {
    var $body = $('body');
    $body.append(modal);
    $body.one('click', '#blockcart-modal', function (event) {
      if (event.target.id === 'blockcart-modal') {
        $(event.target).remove();
      }
    });
  };

  var psAjaxCart = false;
  if (typeof(varPSAjaxCart) !== 'undefined' && varPSAjaxCart) {
    psAjaxCart = varPSAjaxCart;
  }

  prestashop.on(
    'updateCart',
    function (event) {
      var refreshURL = $('.blockcart').data('refresh-url');
      var requestData = {};

      if (event && event.reason && event.reason.idProduct) {
        requestData = {
          id_product_attribute: event.reason.idProductAttribute,
          id_product: event.reason.idProduct,
          action: event.reason.linkAction
        };
      }

      $.post(refreshURL, requestData).then(function (resp) {
        $('.blockcart .cart-header').replaceWith($(resp.preview).find('.blockcart .cart-header'));
        $('.blockcart .cart-dropdown-wrapper').replaceWith($(resp.preview).find('.blockcart .cart-dropdown-wrapper'));
        //$('.blockcart').removeClass('inactive').addClass('active');
        
        $('[data-sticky-cart]').html($('[data-sticky-cart-source]').html());

        if (typeof(varSidebarCart) !== 'undefined' && varSidebarCart && psAjaxCart) {
          $('#js-cart-sidebar').html($('[data-shopping-cart-source]').html());
          $.each($('#js-cart-sidebar input[name="product-sidebar-quantity-spin"]'), function (index, spinner) {
            $(spinner).makeTouchSpin();

            $(spinner).on('change', function () {
              $(spinner).trigger('focusout');
            });
          });
          if (resp.modal) {
            $('html').addClass('st-effect-right st-menu-open');

            setTimeout(function(){
              if (prestashop.page.page_name == 'product') {
                prestashop.emit('updateProduct', {});
              }
            }, 500);
          }
        } else {
          if (psAjaxCart && resp.modal) {
            showModal(resp.modal);
          }
        }

        $('.js-ajax-add-to-cart').removeClass('disabled');
        $('[data-button-action="add-to-cart"]').removeClass('disabled');
        $('.js-cart-update-voucher, .js-cart-update-quantity').fadeOut();
      }).fail(function (resp) {
        prestashop.emit('handleError', {eventType: 'updateShoppingCart', resp: resp});
      });
    }
  );
});
