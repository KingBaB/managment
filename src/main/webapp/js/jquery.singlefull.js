;
// The polyfill for Array.prototype.indexOf
if (!Array.prototype.indexOf) {
    Array.prototype.indexOf = function(searchElement, fromIndex) {
        var k;
        if (this == null) {
            throw new TypeError('"this" is null or not defined');
        }
        var O = Object(this);
        var len = O.length >>> 0;
        if (len === 0) {
            return -1;
        }
        var n = +fromIndex || 0;

        if (Math.abs(n) === Infinity) {
            n = 0;
        }
        if (n >= len) {
            return -1;
        }
        k = Math.max(n >= 0 ? n : len - Math.abs(n), 0);
        while (k < len) {
            if (k in O && O[k] === searchElement) {
                return k;
            }
            k++;
        }
        return -1;
    };
}



;
(function($, window) {
    //'use strict';
    $.fn.singlefull = function(options) {

        var opts = $.extend({}, $.fn.singlefull.defaults, options);

        var sectionList = []; // 页面section名称集合
        $("[" + opts.section + "]").each(function(index, elem) {
            sectionList.push($(this).attr(opts.section));
        });

        var currentIndex = 0; // 记录当前滚动页面的index
        var isAnimating = false; // 记录当前页面是否在动画中，若在动画中则不再响应鼠标滚轮事件


        // 监听鼠标滚轮事件
        $(document).on("mousewheel DOMMouseScroll MozMousePixelScroll", scrollPage);

        if (opts.keyboard) {
            // 监听键盘事件
            $(document).on("keydown", function(event) {
                var code = event.keyCode;
                if (code == 38 || code == 40) {
                    var sectionListLength = sectionList.length;
                    var nextIndex = (code == 38) ? ((sectionListLength + currentIndex - 1) % sectionListLength) : ((sectionListLength + currentIndex + 1) % sectionListLength);
                    goToSection(sectionList[nextIndex], opts);
                }

            });
        }

        // 是否出现导航点
        if (!opts.navigation) {
            $('#fp-nav').css('display', 'none');
        } else {
            $('#fp-nav').addClass(opts.navigationPosition);
        }


        return this.each(function() {

            // Get the instance
            var element = $(this);

            // Resize the "data-target" divs
            changeCSS(element);
            // Resize all the "data-img='true'" images
            changeIMG(opts);

            // Bind the methods changeCSS and changeIMG to the resize window event
            $(window).on("resize", function() {
                changeCSS(element);
                changeIMG(opts);
            });


            // 右侧锚绑定点击事件
            $('[' + opts.anchor + ']').bind("click", function(event) {
                event.preventDefault();
                var target = $(this).attr(opts.anchor);
                var targetIndex = sectionList.indexOf(target);
                goToSection(sectionList[targetIndex], opts);
            });



        });

        // function to handle mousewheel event
        function scrollPage(event) {
            event.preventDefault();
            var sectionListLength = sectionList.length;
            var delta = event.originalEvent.wheelDelta || -event.originalEvent.detail;
            var nextIndex = delta > 0 ?
                ((sectionListLength + currentIndex - 1) % sectionListLength) :
                ((sectionListLength + currentIndex + 1) % sectionListLength);
            // 出现首尾轮播时，判断是否允许
            var isCanScroll = opts.loopScroll;
            if (currentIndex == 0 && nextIndex == sectionListLength - 1) {
                isCanScroll = isCanScroll && opts.loopTop;
            }

            if (nextIndex == 0 && currentIndex == sectionListLength - 1) {
                isCanScroll = isCanScroll && opts.loopBottom;
            }
            if (isCanScroll) {
                goToSection(sectionList[nextIndex], opts);
            }
        }


        // function to scroll the page to a section
        function goToSection(secName, opts) {
            // get the position of the target
            var targetPosition = $('[' + opts.section + '="' + secName + '"]').position().top;
            // 当前页面正在动画时，不响应此次事件
            if (!isAnimating) {
                isAnimating = true;
                currentIndex = sectionList.indexOf(secName);
                changeAnchorClass();
                // jQuery Easing animation
                $("html,body").animate({
                    scrollTop: targetPosition
                }, {
                    duration: opts.scrollingSpeed,
                    easing: opts.easing,
                    complete: function() {
                        isAnimating = false; // 动画完成，解除锁定
                    }
                });
            }
        }


        // 改变锚的样式
        function changeAnchorClass() {
            if ($('[' + opts.anchor + ']').length) {
                $('[' + opts.anchor + ']').removeClass('active');
                $('[' + opts.anchor + '= "' + sectionList[currentIndex] + '"]').addClass('active');
            }
        }


        // function to resize all the "data-target" divs
        function changeCSS(element) {

            // Grab the screen resolution
            var windowWidth = "100%";
            var windowHeight = $(window).height();
            // Count how many targets the div has
            var targetsSize = $("[" + opts.section + "]").length;

            // Resize the parent div
            $(element).css({
                "width": windowWidth,
                "height": windowHeight * targetsSize
            });

            // Resize all the targets div
            $(element).children("div[" + opts.section + "]").each(function() {
                $(this).css({
                    "width": windowWidth,
                    "height": windowHeight
                });
            });
        }

        // function to resize the images
        function changeIMG(opts) {
            // Grab the screen resolution
            windowWidth = $(window).width();
            $("img[data-img='true']").each(function(index, element) {
                src = $(element).attr('src');
                imgName = "";
                imgFinal = "";
                imgSplit = {};
                imagePrefix = checkResolution(windowWidth, opts);
                if (src.match("/")) { // Match if there's a full URL at the IMG src and cut it
                    re = new RegExp(".*\/(.*)$");
                    m = re.exec(src);
                    imgName = m[1];
                } else {
                    // Just the img without an URL
                    imgName = src;
                }
                if (imgName.match(/\-\w+/)) {
                    src = src.replace(/\-\w+/, imagePrefix);
                } else {
                    // Split the name of the extension
                    imgSplit = imgName.split('.');
                    // Replace the name with the image prefix
                    imgFinal = imgSplit[0] + imagePrefix + '.' + imgSplit[1];
                    src = src.replace(imgName, imgFinal);
                }
                // Replace the image
                $(element).attr('src', src);
            });

        }

        // function to check the resolution and return the prefix for the image
        function checkResolution(windowWidth, opts) {

            if (windowWidth <= 480) {
                return opts.sufixes.smallest;
            }

            if (windowWidth > 480 && windowWidth <= 767) {
                return opts.sufixes.small;
            }

            if (windowWidth > 767 && windowWidth <= 979) {
                return opts.sufixes.medium;
            }

            if (windowWidth > 979) {
                return opts.sufixes.normal;
            }

        }

    };

    // Plugin defaults
    $.fn.singlefull.defaults = {
        scrollingSpeed: 1000,
        easing: "easeOutExpo",
        // section 是页面滚动的基本单位，需要一页显示的div请添加定义的属性，默认data-target
        section: 'data-target',
        // anchor 是页面锚，通过点击锚跳转至特定section，默认data-anchor
        anchor: 'data-anchor',

        // ************  Scrolling  **********//
        keyboard: true, // 是否接受键盘操作
        loopScroll: true, // 是否允许循环轮播  优先级高于loopTop与loopBottom 
        loopTop: true, // 是否允许从第一页滚屏至最后一页
        loopBottom: true, // 是否允许从最后一页滚屏至第一页

        // ************  Navigation  **********//
        navigation: true, // 是否允许出现导航点
        navigationPosition: 'right', // 导航点的位置，默认在右边
        // 根据屏幕大小决定图片的前缀
        sufixes: {
            smallest: "-smallest",
            small: "-small",
            medium: "-medium",
            normal: "" // Leave blank for no prefix
        }
    };
})(jQuery, window);
