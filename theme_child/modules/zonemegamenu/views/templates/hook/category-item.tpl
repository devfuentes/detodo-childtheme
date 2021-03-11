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
          {$lang = $subcategory.id_lang }
          {$subcategories = Category::getChildren($subcategory.id_category, $subcategory.id_lang)}
          {$total_categorias = count($subcategories)}
          {if $total_categorias > 0}
            <li class="submenu__trigger" data-id="{$subcategory.id_category}">
          {else}
            <li class="submenu__trigger--off">
          {/if}

          <a href="{$subcategory.url}">{if $subcategory.menu_thumb}<img src="{$subcategory.menu_thumb}" alt="{$subcategory.name}" />{/if}<span>{$subcategory.name}</span></a>
        </li>
        
        {if $total_categorias > 0}
          <div class="submenu" id="submenu-{$subcategory.id_category}">
            <h2 class="submenu__title"><a href="{$subcategory.url}">{$subcategory.name}</a></h2>
            <div class="row mt-4">
            {* {$subcategories|print_r} *}
            {* SUBCATEGORIAS PRIMER NIVEL *}
            {foreach from=$subcategories item=subcategory_level1}
            {* {$subcategory_level1 | print_r} *}
              <div class="col-sm-12 col-md-4 mb-3">
                <h3 class="submenu__subtitle"><a href="index.php?id_category={$subcategory_level1.id_category}&controller=category">{$subcategory_level1.name}</a></h3>
                  <ul class="submenu__list">
                    {$subcategory_level2 = Category::getChildren($subcategory_level1.id_category, $lang)}
                    {foreach from=$subcategory_level2 item=level2}
                      <li><a href="index.php?id_category={$level2.id_category}&controller=category">{$level2.name}</a></li>
                    {/foreach}
                  </ul>
              </div>
            {/foreach}
              
            </div>
          </div>
        {/if}

      {/foreach}
      
    </ul>
  {/if}
</div>


<script>

(function() {
   var submenuTrigger = document.getElementsByClassName("submenu__trigger");
   var submenuContainer = document.getElementsByClassName("submenu");
   var listItem = document.getElementsByClassName("submenu__trigger--off");


  for (var i = 0; i < submenuTrigger.length; i++) {
    submenuTrigger[i].addEventListener('mouseover', openMegaMenu, false);
  }

  for (var i = 0; i < listItem.length; i++) {
    listItem[i].addEventListener('mouseover', closeMegaMenu, false);
  }

  for (var i = 0; i < submenuContainer.length; i++) {
    submenuContainer[i].addEventListener('mouseleave', closeMegaMenu, false);
  }

  function openMegaMenu(){
    var id = this.getAttribute("data-id");
    var submenu = document.getElementById('submenu-'+id);
    submenu.style.display = "block";
  }

  function closeMegaMenu(){
    var submenuClass = document.getElementsByClassName('submenu');
    for (var i = 0; i < submenuClass.length; i++) {
    submenuClass[i].style.display="none";
  }
  }


})();
</script>