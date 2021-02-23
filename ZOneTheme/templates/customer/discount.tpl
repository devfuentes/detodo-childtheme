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
{extends file='customer/page.tpl'}

{block name='page_title'}
  {l s='Your vouchers' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
  {if $cart_rules}
    <div class="d-none d-lg-block">
      <table class="table table-bordered">
        <thead class="thead-default">
          <tr>
            <th>{l s='Code' d='Shop.Theme.Checkout'}</th>
            <th>{l s='Description' d='Shop.Theme.Checkout'}</th>
            <th>{l s='Quantity' d='Shop.Theme.Checkout'}</th>
            <th>{l s='Value' d='Shop.Theme.Checkout'}</th>
            <th>{l s='Minimum' d='Shop.Theme.Checkout'}</th>
            <th>{l s='Cumulative' d='Shop.Theme.Checkout'}</th>
            <th>{l s='Expiration date' d='Shop.Theme.Checkout'}</th>
          </tr>
        </thead>
        <tbody>
          {foreach from=$cart_rules item=cart_rule}
            <tr>
              <th scope="row">{$cart_rule.code}</th>
              <td>{$cart_rule.name}</td>
              <td class="text-right">{$cart_rule.quantity_for_user}</td>
              <td>{$cart_rule.value}</td>
              <td>{$cart_rule.voucher_minimal}</td>
              <td>{$cart_rule.voucher_cumulable}</td>
              <td>{$cart_rule.voucher_date}</td>
            </tr>
          {/foreach}
        </tbody>
      </table>
    </div>
    <div class="cart-rules d-block d-lg-none">
      {foreach from=$cart_rules item=cart_rule}
        <div class="cart-rule light-box-bg sm-bottom">
          <div class="row">
            <div class="col-6 font-weight-bold">{l s='Code' d='Shop.Theme.Checkout'}</div>
            <div class="col-6 font-weight-bold">{$cart_rule.code}</div>

            <div class="col-6 font-weight-bold">{l s='Description' d='Shop.Theme.Checkout'}</div>
            <div class="col-6">{$cart_rule.name}</div>

            <div class="col-6 font-weight-bold">{l s='Quantity' d='Shop.Theme.Checkout'}</div>
            <div class="col-6">{$cart_rule.quantity_for_user}</div>

            <div class="col-6 font-weight-bold">{l s='Value' d='Shop.Theme.Checkout'}</div>
            <div class="col-6">{$cart_rule.value}</div>

            <div class="col-6 font-weight-bold">{l s='Minimum' d='Shop.Theme.Checkout'}</div>
            <div class="col-6">{$cart_rule.voucher_minimal}</div>

            <div class="col-6 font-weight-bold">{l s='Cumulative' d='Shop.Theme.Checkout'}</div>
            <div class="col-6">{$cart_rule.voucher_cumulable}</div>

            <div class="col-6 font-weight-bold">{l s='Expiration date' d='Shop.Theme.Checkout'}</div>
            <div class="col-6">{$cart_rule.voucher_date}</div>
          </div>
        </div>
      {/foreach}
    </div>
  {/if}
{/block}
