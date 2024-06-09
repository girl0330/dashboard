/*

Template: Jobber - Job Board HTML5 Template
Author: potenzaglobalsolutions.com
Design and Developed by: potenzaglobalsolutions.com

NOTE: This file contains all scripts for the actual Template.

*/

/*================================================
[  Table of contents  ]
================================================

:: Preloader
:: Menu
:: Tooltip
:: Counter
:: Owl carousel
:: Slickslider
:: Magnific Popup
:: Datetimepicker
:: Select2
:: Range Slider
:: Countdown
:: Scrollbar
:: Back to top

======================================
[ End table content ]
======================================*/
//POTENZA var

( function ($) {
  "use strict";
  var POTENZA = {};

	/*************************
	  Predefined Variables
	*************************/

	var $window     = $(window),
    $document       = $(document),
    $body           = $('body'),
    $countdownTimer = $('.countdown'),
    $counter        = $('.counter');

	//Check if function exists
	$.fn.exists = function () {
		return this.length > 0;
	};

	/*************************
		Preloader
    *************************/

	POTENZA.preloader = function () {
       $("#load").fadeOut();
       $('#pre-loader').delay(0).fadeOut('slow');
	};

	/*************************
		menu
	*************************/
	POTENZA.dropdownmenu = function () {
		if ( $('.navbar').exists() ) {
			$('.dropdown-menu a.dropdown-toggle').on('click', function (e) {
				if ( !$(this).next().hasClass('show') ) {
					$(this).parents('.dropdown-menu').first().find('.show').removeClass("show");
				}
				var $subMenu = $(this).next(".dropdown-menu");
				$subMenu.toggleClass('show');

				$(this).parents('li.nav-item.dropdown.show').on('hidden.bs.dropdown', function (e) {
					$('.dropdown-submenu .show').removeClass("show");
				});
				return false;
			});
		}
	};

	$(document).ready(function(){
		$('#nav-icon4').on( 'click', function(){
			$(this).toggleClass('open');
		});
	});

	/*************************
		sticky
	*************************/
	POTENZA.isSticky = function () {
		$(window).scroll( function(){
			if ($(this).scrollTop() > 150) {
				$('.header-sticky').addClass('is-sticky');
			} else {
				$('.header-sticky').removeClass('is-sticky');
			}
		});
	};

  /*************************
       Tooltip
  *************************/
  POTENZA.Tooltip = function() {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
      var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
  }

  /*************************
        Popover
  *************************/
  POTENZA.Popover = function() {
    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
      var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl)
    })
  }

	/*************************
		counter
	*************************/

	POTENZA.counters = function () {
		var counter = jQuery(".counter");
		if (counter.length > 0) {
			$counter.each(function () {
				var $elem = $(this);
				$elem.appear(function () {
					$elem.find('.timer').countTo();
				});
			});
		}
	};

	/*************************
       owl carousel
	*************************/

	POTENZA.carousel = function () {
		var owlslider = jQuery("div.owl-carousel");
		if ( owlslider.length > 0 ) {
			owlslider.each( function () {
			var $this = $(this),
				$items = ($this.data('items')) ? $this.data('items') : 1,
				$loop = ($this.attr('data-loop')) ? $this.data('loop') : true,
				$navdots = ($this.data('nav-dots')) ? $this.data('nav-dots') : false,
				$navarrow = ($this.data('nav-arrow')) ? $this.data('nav-arrow') : false,
				$autoplay = ($this.attr('data-autoplay')) ? $this.data('autoplay') : true,
				$autospeed = ($this.attr('data-autospeed')) ? $this.data('autospeed') : 5000,
				$smartspeed = ($this.attr('data-smartspeed')) ? $this.data('smartspeed') : 1500,
				$autohgt = ($this.data('autoheight')) ? $this.data('autoheight') : false,
				$space = ($this.attr('data-space')) ? $this.data('space') : 30,
				$animateOut = ($this.attr('data-animateOut')) ? $this.data('animateOut') : false;

				$(this).owlCarousel({
					loop: $loop,
					items: $items,
					responsive: {
						0: {
							items: $this.data('xx-items') ? $this.data('xx-items') : 1
						},
						480: {
							items: $this.data('xs-items') ? $this.data('xs-items') : 1
						},
						768: {
							items: $this.data('sm-items') ? $this.data('sm-items') : 2
						},
						980: {
							items: $this.data('md-items') ? $this.data('md-items') : 3
						},
						1200: {
							items: $items
						}
					},
					dots: $navdots,
					autoplayTimeout: $autospeed,
					smartSpeed: $smartspeed,
					autoHeight: $autohgt,
					margin: $space,
					nav: $navarrow,
					navText: ["<i class='fas fa-chevron-left'></i>", "<i class='fas fa-chevron-right'></i>"],
					autoplay: $autoplay,
					autoplayHoverPause: true
				});
			});
		}
	}

	/*************************
        slickslider
	*************************/

	POTENZA.slickslider = function () {
		if ( $('.slider-for').exists() ) {
			$('.slider-for').slick({
				slidesToShow: 1,
				slidesToScroll: 1,
				arrows: true,
				asNavFor: '.slider-nav'
			});
			$('.slider-nav').slick({
				slidesToShow: 3,
				slidesToScroll: 1,
				asNavFor: '.slider-for',
				dots: false,
				centerMode: true,
				focusOnSelect: true
			});
		}
	};

	/*************************
		Magnific Popup
	*************************/

	POTENZA.mediaPopups = function () {
		if ($(".popup-single").exists() || $(".popup-gallery").exists() || $('.modal-onload').exists() || $(".popup-youtube, .popup-vimeo, .popup-gmaps").exists()) {
			if ($(".popup-single").exists()) {
				$('.popup-single').magnificPopup({
					type: 'image'
				});
			}

			if ( $(".popup-gallery").exists() ) {
				$('.popup-gallery').magnificPopup({
					delegate: 'a.portfolio-img',
					type: 'image',
					tLoading: 'Loading image #%curr%...',
					mainClass: 'mfp-img-mobile',
					gallery: {
						enabled: true,
						navigateByImgClick: true,
						preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
					}
				});
			}

			if ( $(".popup-youtube, .popup-vimeo, .popup-gmaps").exists() ) {
				$('.popup-youtube, .popup-vimeo, .popup-gmaps').magnificPopup({
					disableOn: 700,
					type: 'iframe',
					mainClass: 'mfp-fade',
					removalDelay: 160,
					preloader: false,
					fixedContentPos: false
				});
			}

			var $modal = $('.modal-onload');
			if ( $modal.length > 0 ) {
				$('.popup-modal').magnificPopup({
					type: 'inline'
				});

				$(document).on('click', '.popup-modal-dismiss', function (e) {
					e.preventDefault();
					$.magnificPopup.close();
				});

				var elementTarget = $modal.attr('data-target');
				setTimeout(function () {
					$.magnificPopup.open({
						items: {
							src: elementTarget
						},
						type: "inline",
						mainClass: "mfp-no-margins mfp-fade",
						closeBtnInside: !0,
						fixedContentPos: !0,
						removalDelay: 500
					}, 0 )
				}, 1500 );
			}
		}
	}

	/*************************
		datetimepicker
	*************************/

  POTENZA.datetimepickers = function () {
    if ($('.datetimepickers').exists()) {
		//한글 설정 추가
		moment.locale('ko', {
			months: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			monthsShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			weekdays: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
			weekdaysShort: ['일', '월', '화', '수', '목', '금', '토'],
			weekdaysMin: ['일', '월', '화', '수', '목', '금', '토'],
			longDateFormat: {
				LT: 'A h:mm',
				LTS: 'A h:mm:ss',
				L: 'YYYY.MM.DD.',
				LL: 'YYYY년 MMMM D일',
				LLL: 'YYYY년 MMMM D일 A h:mm',
				LLLL: 'YYYY년 MMMM D일 dddd A h:mm',
				l: 'YYYY.MM.DD.',
				ll: 'YYYY년 MMMM D일',
				lll: 'YYYY년 MMMM D일 A h:mm',
				llll: 'YYYY년 MMMM D일 dddd A h:mm'
			},
			calendar: {
				sameDay: '[오늘] LT',
				nextDay: '[내일] LT',
				nextWeek: 'dddd LT',
				lastDay: '[어제] LT',
				lastWeek: '[지난] dddd LT',
				sameElse: 'L'
			},
			relativeTime: {
				future: '%s 후',
				past: '%s 전',
				s: '몇 초',
				ss: '%d초',
				m: '1분',
				mm: '%d분',
				h: '한 시간',
				hh: '%d시간',
				d: '하루',
				dd: '%d일',
				M: '한 달',
				MM: '%d달',
				y: '일 년',
				yy: '%d년'
			},
			dayOfMonthOrdinalParse: /\d{1,2}(일|월|주)/,
			ordinal: function (number, period) {
				switch (period) {
					case 'd':
					case 'D':
					case 'DDD':
						return number + '일';
					case 'M':
						return number + '월';
					case 'w':
					case 'W':
						return number + '주';
					default:
						return number;
				}
			},
			meridiemParse: /오전|오후/,
			isPM: function (token) {
				return token === '오후';
			},
			meridiem: function (hour, minute, isUpper) {
				return hour < 12 ? '오전' : '오후';
			}
		});

      $('#datetimepicker-01, #datetimepicker-02, #datetimepicker-05, #datetimepicker-06, #datetimepicker-07, #datetimepicker-08, #datetimepicker-09, #datetimepicker-10, #datetimepicker-11, #datetimepicker-12, #datetimepicker-13, #datetimepicker-14').datetimepicker({
		  format: 'YYYY-MM-DD', // 날짜 포맷 설정
		  locale: 'ko' // 한글 설정
      });
      $('#datetimepicker-03, #datetimepicker-04').datetimepicker({
        format: 'LT',
        minuteStep:15
      });
    }
  };

	/*************************
		select2
	*************************/

	POTENZA.select2 = function () {
		if ( $('.basic-select').exists() ) {
			var select = jQuery(".basic-select");
			if ( select.length > 0 ) {
				$('.basic-select').select2();
			}
		}
	};

	/*************************
		Range Slider
	*************************/

	POTENZA.rangesliders = function () {
		if ( $('.property-price-slider').exists() ) {
			var rangeslider = jQuery(".rangeslider-wrapper");
			$("#property-price-slider").ionRangeSlider({
				type: "double",
				min: 0,
				max: 10000,
				prefix: "$"
			});
		}
	};

	/*************************
	   Countdown
	*************************/

	POTENZA.countdownTimer = function () {
		if ($countdownTimer.exists()) {
			$countdownTimer.downCount({
				date: '12/25/2023 12:00:00', // Month/Date/Year HH:MM:SS
				offset: 400
			});
		}
	}

    /*************************
        BgSlider
	*************************/

	POTENZA.bgSlider = function () {
		var $bgSlider = $('#bg-slider');
		if ( $bgSlider.exists() ) {
			$("#bg-slider").kenburnsy({
				fullscreen: false
			});
		}
	}

	/*************************
		scrollbar
	*************************/

	POTENZA.scrollbar = function () {
		var scrollbar = jQuery(".scrollbar");
		if ( scrollbar.length > 0 ) {

			// Sidebar Scroll
			var scroll_light = jQuery(".scroll_light");
			if ( scroll_light.length > 0 ) {
				$( scroll_light ).niceScroll({
					cursorborder: 0,
					cursorcolor: "rgba(255,255,255,0.25)"
				});
				$(scroll_light).getNiceScroll().resize();
			}

			// Chat Scroll
			var scroll_dark = jQuery(".scroll_dark");
			if ( scroll_dark.length > 0 ) {
				$(scroll_dark).niceScroll({
					cursorborder: 0,
					cursorcolor: "rgba(0,0,0,0.1)"
				});
				$(scroll_dark).getNiceScroll().resize();
			}
		}
	}


	/*************************
		Secondary menu
	*************************/

	POTENZA.secondarymenu = function () {
		$(".secondary-menu ul li a[href^='#']").on('click', function(e) {

			// prevent default anchor click behavior
			e.preventDefault();

			// store hash
			var hash = this.hash;

			// animate
			$('html, body').animate({
				scrollTop: $(hash).offset().top
			 }, 1000, function(){
				// when done, add hash to url
				// (default click behaviour)
				window.location.hash = hash;
			});
		});
	}


	/*************************
		Back to top
	*************************/

	POTENZA.goToTop = function () {
		var $goToTop = $('#back-to-top');
		$goToTop.hide();
		$window.scroll( function () {
			if ( $window.scrollTop() > 100 ) $goToTop.fadeIn();
			else $goToTop.fadeOut();
		});

		$goToTop.on("click", function () {
			$('body,html').animate({
				scrollTop: 0
			}, 1000);
			return false;
		});
	}

	/****************************************************
		POTENZA Window load and functions
	****************************************************/

	// Window load functions
	$window.on("load", function () {
		POTENZA.preloader();
	});

	// Document ready functions
	$document.ready(function () {
		POTENZA.counters(),
		POTENZA.slickslider(),
		POTENZA.datetimepickers(),
		POTENZA.select2(),
		POTENZA.dropdownmenu(),
		POTENZA.isSticky(),
		POTENZA.scrollbar(),
		POTENZA.goToTop(),
		POTENZA.bgSlider(),
		POTENZA.countdownTimer(),
		POTENZA.secondarymenu(),
		POTENZA.mediaPopups(),
		POTENZA.Tooltip(),
    POTENZA.Popover(),
		POTENZA.rangesliders(),
		POTENZA.carousel();
	});
})(jQuery);

