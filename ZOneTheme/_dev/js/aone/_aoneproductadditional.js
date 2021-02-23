function restartIframeInModalContent() {
  $('.js-extraFieldPopup').each(function() {
    var $iframes = $(this).find('iframe');
    $(this).on('hidden.bs.modal', function () {      
      $iframes.each(function() {
        $(this).attr('src', $(this).attr('src'));
      });
    });
  });
}

function switchCombination() {
  $('body').on('click', '.js-switch-cbnt', function(e) {
    e.preventDefault();

    if (!$(this).hasClass('active')) {
      $(this).parent().children().removeClass('active');
      $(this).addClass('active');
      let groups = $(this).data('groups');
      for (g in groups) {
        $('.product-variants [data-product-attribute="'+g+'"]').val(groups[g]).trigger('change');
      }
    }

    return false;
  });
}

function productSwatchesEvent() {
  $('body').on('click', '.js-swatch-item', function(e) {
    let id_group = $(this).parent().attr('data-id-group'),
        id_attribute = $(this).attr('data-id-attribute');
    $(this).parent().children().removeClass('selected');
    $(this).addClass('selected');
    $('.product-variants [data-product-attribute="'+id_group+'"]').val(id_attribute).change();
  });
}

function countdownSpecificPrices() {
  if (typeof(varGetFinalDateController) !== 'undefined') {
    setTimeout(function() {
      $('.js-product-countdown').runCountdown({
        specificPricesTo: $('.js-product-countdown').attr('data-specific-prices-to'),
        getFinalDateController: varGetFinalDateController
      });
    }, 300);
    
    prestashop.on('updatedProduct', function (event) {
      $('.js-product-countdown').updateCountdown({
        newSpecificPricesTo: $('.js-new-specific-prices-to').attr('data-new-specific-prices-to'),
        currentSpecificPricesTo: $('.js-product-countdown').attr('data-specific-prices-to'),
        getFinalDateController: varGetFinalDateController
      });
    });
  }
}

$(window).load(function() {
  restartIframeInModalContent();
  switchCombination();
  countdownSpecificPrices();
  productSwatchesEvent();
});