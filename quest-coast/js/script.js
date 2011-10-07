$(function(){
        var $fliers = $('article');

        function shiftFliers() {
            if ($fliers.length > 1) {
                $fliers = $fliers.slice(1);
                $fliers.animate({ left: '+=510' }, 400, shiftFliers);
            }
        }

        $(document).ready(function () {
                var zIndex = 100;

                $fliers.css({
                        position: 'absolute',
                        top: '0px',
                        left: '0px'
                    }
                ).each(function() {
                        $(this).css({ 'z-index': zIndex-- });
                }).filter(':not(.legend)').css({
                        opacity: 0.90
                }).hover(
                    function () {
                        console.log(this);
                        $(this).fadeTo(50, 1);
                    },
                    function () {
                        $(this).fadeTo(500, 0.90);
                    }
                );

                shiftFliers();
        });
});
