$(document).ready(function() {
    $(".btn-outline").click(function(e){
        e.preventDefault();
        const targetPosition = $(".category-slider-section").offset().top;
        const headerHeight = $(".navbar").outerHeight();
        $("html, body").animate({
            scrollTop: targetPosition - headerHeight
        }, 800);
    });

    $('#cat-next, .slider-btn.next').click(function(e){
        e.preventDefault();
        const $slider = $(this).closest("section").find(".product-slider");
        const cardWidth = $slider.children().first().outerWidth(true);
        $slider.animate({scrollLeft: '+=' + cardWidth}, 300);
    });

    $("#cat-prev, .slider-btn.prev").click(function(e) {
        e.preventDefault();
        const $slider = $(this).closest("section").find(".product-slider");
        const cardWidth = $slider.children().first().outerWidth(true);
        $slider.animate({ scrollLeft: '-=' + cardWidth }, 300);
    });
});