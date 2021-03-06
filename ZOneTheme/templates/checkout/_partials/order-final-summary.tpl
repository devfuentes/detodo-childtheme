{**
 * 2007-2019 PrestaShop and Contributors
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/OSL-3.0
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2019 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
<section id="order-summary-content" class="page-content page-order-confirmation">
  <h5 class="alert alert-info">{l s='Please check your order before payment' d='Shop.Theme.Checkout'}</h5>

  <div class="order-summary-block order-summary-address mb-2">
    <h5 class="d-flex">
      {l s='Addresses' d='Shop.Theme.Checkout'}
      <span class="step-edit step-to-addresses js-edit-addresses"><i class="material-icons edit">mode_edit</i> {l s='Edit' d='Shop.Theme.Actions'}</span>
    </h5>

    <div class="row">
      <div class="col-12 col-md-6">
        <div class="card">
          <div class="card-block">
            <h5 class="addresshead">{l s='Your Delivery Address' d='Shop.Theme.Checkout'}</h5>
            {$customer.addresses[$cart.id_address_delivery]['formatted'] nofilter}
          </div>
        </div>
      </div>
      <div class="col-12 col-md-6">
        <div class="card">
          <div class="card-block">
            <h5 class="addresshead">{l s='Your Invoice Address' d='Shop.Theme.Checkout'}</h5>
            {$customer.addresses[$cart.id_address_invoice]['formatted'] nofilter}
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <div class="order-summary-block order-summary-shipping mb-4">
    <h5 class="d-flex">
      {l s='Shipping Method' d='Shop.Theme.Checkout'}
      <span class="step-edit step-to-delivery js-edit-delivery"><i class="material-icons edit">mode_edit</i> {l s='Edit' d='Shop.Theme.Actions'}</span>
    </h5>
    <div class="summary-selected-carrier light-box-bg grid-small-padding">
      <div class="row">
        <div class="col-md-6 col-12">
          <div class="row">
            <div class="col-4">
              <div class="logo-container">
                {if $selected_delivery_option.logo}
                  <img src="{$selected_delivery_option.logo}" alt="{$selected_delivery_option.name}">
                {else}
                  &nbsp;
                {/if}
              </div>
            </div>
            <div class="col-8">
              <span class="carrier-name">{$selected_delivery_option.name}</span>
            </div>
          </div>
        </div>
        <div class="col-md-4 offset-md-0 col-9">
          <span class="carrier-delay">{$selected_delivery_option.delay}</span>
        </div>
        <div class="col-md-2 offset-md-0 col-3">
          <span class="carrier-price">{$selected_delivery_option.price}</span>
        </div>
      </div>
    </div>
  </div>

  <div class="order-summary-block order-summary-items mb-5">
    <div class="row">
      {block name='order_confirmation_table'}
        {include file='checkout/_partials/order-final-summary-table.tpl'
          products=$cart.products
          products_count=$cart.products_count
          subtotals=$cart.subtotals
          totals=$cart.totals
          labels=$cart.labels
          add_product_link=true
        }
      {/block}
    </div>
  </div>
</section>
