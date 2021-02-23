function addBodyTouchClass() {
    if ('ontouchstart' in document.documentElement) {
        $('body').addClass('touch-screen');
    }
}

function addTooltip() {
    $('body:not(.touch-screen) [data-toggle="tooltip"]').tooltip({
        position: { my: "center bottom-8", at: "center top" },
        hide: false,
        show: false,
    });
}

function updateCustomerDropdownMenu() {
    var $otherLinks = $('.js-otherCustomerDropdownLinks');
    if ($otherLinks.length) {
        $('.js-displayCustomerAccount > a').each(function() {
            $(this).removeAttr('id').removeAttr('class').addClass('dropdown-item');
            var $span = $(this).find('span'),
                $i = $span.find('i');
            $span.removeAttr('class');
            $(this).remove('i');
            $(this).append($i);

            var $newThis = $(this).wrap('<li></li>').parent();
            $newThis.insertBefore($otherLinks);
        });
    }
}

function expandPSCategoryTree() {
    var currentCatID = $('.js-category-page').data('current-category-id');

    if (currentCatID !== 'undefined' && currentCatID !== '') {
        var $currentCatObj = $('.js-category-tree [data-category-id=' + currentCatID + ']');

        $currentCatObj.addClass('current');
        $currentCatObj.parents('li').each(function() {
            $(this).children('[data-toggle="collapse"]').attr('aria-expanded', 'true');
            $(this).children('.category-sub-menu.collapse').addClass('show');
        });
    }
}

function categoryDescriptionExpand() {
    var $cat_description = $('.js-small-description');
    if ($cat_description.length) {
        if ($cat_description.height() > $cat_description.data('max-height')) {
            $cat_description.addClass('see-more');
            $('.js-expand-description').click(function() {
                $cat_description.removeClass('see-more');
                return false;
            });
        }
    }
}

function mobileMenuControl() {
  $('#mobile-menu-icon').on('click', function() {
    $('#dropdown-mobile-menu').stop().slideToggle();
  });
}

/*function addCustomDropdown() {
    $('.js-dropdown-toggle').each(function() {
        var $title = $(this).find('.dropdown-title'),
            $content = $(this).find('.dropdown-content');
        $title.click(function() {
            $content.stop().slideToggle();
        });
    });
}*/

$(document).ready(function() {
    addBodyTouchClass();
});
$(window).load(function() {
    addTooltip();
    updateCustomerDropdownMenu();
    expandPSCategoryTree();
    categoryDescriptionExpand();
    mobileMenuControl();
});