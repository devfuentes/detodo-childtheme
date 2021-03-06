{*
* 2007-2019 PrestaShop and Contributors
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2019 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<section class="viewed-products mb-2">
  <div class="block clearfix">
    <h3 class="title-block">
      <span>{l s='Viewed products' d='Modules.Viewedproduct.Shop'}</span>
    </h3>

    <div class="product-list shown-index">
      <div class="product-list-wrapper clearfix grid columns-5">
        {foreach from=$products item="product"}
          {include file='catalog/_partials/miniatures/product-home-grid.tpl' product=$product}
        {/foreach}
      </div>
    </div>

    <div class="product-list hidden-index">
      {if isset($zoneIsMobile) && $zoneIsMobile}
        <div class="product-list-wrapper clearfix grid columns-5 product-mobile-slider js-product-page-mobile-slider">
          {foreach from=$products item="product"}
            {include file='catalog/_partials/miniatures/product-simple.tpl' product=$product}
          {/foreach}
        </div>
      {else}
        <div class="product-list-wrapper clearfix grid columns-5 columns-slick js-viewedproduct-slider">
          {foreach from=$products item="product"}
            {include file='catalog/_partials/miniatures/product-simple.tpl' product=$product}
          {/foreach}
        </div>
      {/if}
    </div>
  </div>
</section>
