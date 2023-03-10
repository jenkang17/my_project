(function($) {
    if (!$.omr) {
        $.omr = new Object();
    };
    $.omr.totemticker = function(el, options) {
        var base = this;
        base.el = el;
        base.$el = $(el);
        base.$el.data("omr.totemticker", base);
        base.init = function() {
            base.options = $.extend({}, $.omr.totemticker.defaultOptions, options);
            base.ticker;
            base.format_ticker();
            base.setup_nav();
            base.start_interval();
        };
        base.start_interval = function() {
            clearInterval(base.ticker);
            if (base.options.direction == 'up') {
                base.ticker = setInterval(function() {
                    base.$el.find('li:last').detach().prependTo(base.$el).css('marginTop', '-' + base.options.row_height);
                    base.$el.find('li:first').animate({
                        marginTop: '0px'
                    }, base.options.speed, function() {});
                }, base.options.interval);
            } else {
                base.ticker = setInterval(function() {
                    base.$el.find('li:first').animate({
                        marginTop: '-' + base.options.row_height
                    }, base.options.speed, function() {
                        $(this).detach().css('marginTop', '0').appendTo(base.$el);
                    });
                }, base.options.interval);
            }
        }
        base.reset_interval = function() {
            clearInterval(base.ticker);
            base.start_interval();
        }
        base.stop_interval = function() {
            clearInterval(base.ticker);
        }
        base.format_ticker = function() {
            if (typeof(base.options.max_items) != "undefined" && base.options.max_items != null) {
                var stripped_height = base.options.row_height.replace(/px/i, '');
                var ticker_height = stripped_height * base.options.max_items;
                base.$el.css({
                    height: ticker_height + 'px',
                    overflow: 'hidden'
                });
            } else {
                base.$el.css({
                    overflow: 'hidden'
                })
            }
        }
        base.setup_nav = function() {
            if (typeof(base.options.stop) != "undefined" && base.options.stop != null) {
                $(base.options.stop).click(function() {
                    base.stop_interval();
                    return false;
                });
            }
            if (typeof(base.options.start) != "undefined" && base.options.start != null) {
                $(base.options.start).click(function() {
                    base.start_interval();
                    return false;
                });
            }
            if (typeof(base.options.previous) != "undefined" && base.options.previous != null) {
                $(base.options.previous).click(function() {
                    base.$el.find('li:last').detach().prependTo(base.$el).css('marginTop', '-' + base.options.row_height);
                    base.$el.find('li:first').animate({
                        marginTop: '0px'
                    }, base.options.speed, function() {
                        base.reset_interval();
                    });
                    return false;
                });
            }
            if (typeof(base.options.next) != "undefined" && base.options.next != null) {
                $(base.options.next).click(function() {
                    base.$el.find('li:first').animate({
                        marginTop: '-' + base.options.row_height
                    }, base.options.speed, function() {
                        $(this).detach().css('marginTop', '0px').appendTo(base.$el);
                        base.reset_interval();
                    });
                    return false;
                });
            }
            if (typeof(base.options.mousestop) != "undefined" && base.options.mousestop === true) {
                base.$el.mouseenter(function() {
                    base.stop_interval();
                }).mouseleave(function() {
                    base.start_interval();
                });
            }
        }
        base.debug_info = function() {
            console.log(base.options);
        }
        base.init();
    };
    $.omr.totemticker.defaultOptions = {
        message: 'Ticker Loaded',
        next: null,
        previous: null,
        stop: null,
        start: null,
        row_height: '100px',
        speed: 800,
        interval: 4000,
        max_items: null,
        mousestop: false,
        direction: 'down'
    };
    $.fn.totemticker = function(options) {
        return this.each(function() {
            (new $.omr.totemticker(this, options));
        });
    };
})(jQuery);