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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2019 PrestaShop SA and Contributors
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{if $sidebarMenus}
<div class="sidebar-categories">
  <div class="category-tree sidebar-category-tree js-sidebar-categories">
    <ul>
    {foreach from=$sidebarMenus item=menu}
      <li>
        <a href="{$menu.link}" title="{$menu.name}" data-category-id="{$menu.id}">{if $menu.menu_thumb}<img src="{$menu.menu_thumb}" alt="{$menu.name}" title="{$menu.name}" />{/if}<span>{$menu.name}</span></a>

        {if isset($menu.children) && $menu.children}
          {include file="module:zonethememanager/views/templates/front/sub_category_tree.tpl" submenus=$menu.children}
        {/if}
      </li>
    {/foreach}
    </ul>
  </div>
</div>
{/if}
