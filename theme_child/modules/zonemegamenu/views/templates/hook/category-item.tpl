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
<div class="category-item">
  <!--{if $category.image && isset($category.image.bySize.category_medium)}
    <p class="category-thumb"><a href="{$category.url}" title=""><img class="img-fluid" src="{$category.image.bySize.category_medium.url}" title="{$category.name}" alt="{$category.meta_title}" /></a></p>
  {/if}-->
  {if $category.id}
    <h5 class="category-title"><a href="{$category.url}">{if $category.menu_thumb}<img src="{$category.menu_thumb}" alt="{$category.name}" />{/if}<span>{$category.name}</span></a></h5>
  {/if}
  {if $category.subcategories}
    <ul class="category-subs">
      {foreach from=$category.subcategories item=subcategory}
        <li>
          <a href="{$subcategory.url}">{if $subcategory.menu_thumb}<img src="{$subcategory.menu_thumb}" alt="{$subcategory.name}" />{/if}<span>{$subcategory.name}</span></a>
        </li>
      {/foreach}
    </ul>
  {/if}
</div>

<div class="submenu">
  <h2 class="submenu__title">De todo para la familia</h2>
  <div class="row mt-4">
    <div class="col-sm-12 col-md-4 mb-3">
      <h3 class="submenu__subtitle">De todo para papá</h3>
      <ul class="submenu__list">
        <li>Ropa</li>
        <li>Ropa</li>
        <li>Ropa</li>
        <li>Ropa</li>
      </ul>
    </div>

    <div class="col-sm-12 col-md-4 mb-3">
      <h3 class="submenu__subtitle">De todo para papá</h3>
      <ul class="submenu__list">
        <li>Ropa</li>
        <li>Ropa</li>
        <li>Ropa</li>
        <li>Ropa</li>
      </ul>
    </div>

    <div class="col-sm-12 col-md-4 mb-3">
      <h3 class="submenu__subtitle">De todo para papá</h3>
      <ul class="submenu__list">
        <li>Ropa</li>
        <li>Ropa</li>
        <li>Ropa</li>
        <li>Ropa</li>
      </ul>
    </div>

    <div class="col-sm-12 col-md-4 mb-3">
      <h3 class="submenu__subtitle">De todo para papá</h3>
      <ul class="submenu__list">
        <li>Ropa</li>
        <li>Ropa</li>
        <li>Ropa</li>
        <li>Ropa</li>
      </ul>
    </div>

   <div class="col-sm-12 col-md-4 mb-3">
      <h3 class="submenu__subtitle">De todo para papá</h3>
      <ul class="submenu__list">
        <li>Ropa</li>
        <li>Ropa</li>
        <li>Ropa</li>
        <li>Ropa</li>
      </ul>
    </div>
  </div>
</div>
