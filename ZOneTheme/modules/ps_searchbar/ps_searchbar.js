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
 *  @author     PrestaShop SA <contact@prestashop.com>
 *  @copyright  2007-2016 PrestaShop SA
 *  @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */

/* global $ */
$(document).ready(function () {
    var $searchWidget = $('#search_widget');
    var $searchBox    = $searchWidget.find('input[type=text]');
    var searchURL     = $searchWidget.attr('data-search-controller-url');

    $.widget('prestashop.psBlockSearchAutocomplete', $.ui.autocomplete, {
        _renderItem: function (ul, product) {
            var cover = '', ref = '';
            if (product.cover && product.cover.small && product.cover.small.url) {
                cover = $('<span>').addClass('cover').html('<img src="'+product.cover.small.url+'" class="img-fluid">');
            }
            if (product.reference && product.reference != '') {
                ref = $('<span>').addClass('pref').html(' (Ref: ' + product.reference + ')');
            }
            return $('<li>').addClass('search-menu-item')
                .append($('<a>').addClass('search-item')
                    .append(cover)
                    .append($('<span>').addClass('info')
                        .append($('<span>').html(product.category_name).addClass('category'))
                        .append($('<span>').html(' &#xE409; ').addClass('separator material-icons'))
                        .append($('<span>').html(product.name).addClass('product'))
                        .append($('<span>').html(product.price).addClass('pprice'))
                        .append(ref)
                    )
                ).appendTo(ul)
            ;
        }
    });

    $searchBox.psBlockSearchAutocomplete({
        source: function (query, response) {
            $.post(searchURL, {
                s: query.term,
                resultsPerPage: 10
            }, null, 'json')
            .then(function (resp) {
                response(resp.products);
            })
            .fail(response);
        },
        select: function (event, ui) {
            var url = ui.item.url;
            window.location.href = url;
        },
    });
});
