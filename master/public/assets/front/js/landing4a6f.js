!function (e, t) {
    "object" == typeof exports && "object" == typeof module ? module.exports = t() : "function" == typeof define && define.amd ? define([], t) : "object" == typeof exports ? exports.HSHeader = t() : e.HSHeader = t()
}(window, function () {
    return d = {
        "./src/js/hs-header.js": function (module, __webpack_exports__, __webpack_require__) {
            "use strict";
            eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"default\", function() { return HSHeader; });\n/* harmony import */ var _observers_sticky__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./observers/sticky */ \"./src/js/observers/sticky.js\");\n/* harmony import */ var _observers_moment_show_hide__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./observers/moment-show-hide */ \"./src/js/observers/moment-show-hide.js\");\n/* harmony import */ var _observers_show_hide__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./observers/show-hide */ \"./src/js/observers/show-hide.js\");\n/* harmony import */ var _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./observers/change-logo */ \"./src/js/observers/change-logo.js\");\n/* harmony import */ var _observers_hide_section__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./observers/hide-section */ \"./src/js/observers/hide-section.js\");\n/* harmony import */ var _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./observers/change-appearance */ \"./src/js/observers/change-appearance.js\");\n/* harmony import */ var _observers_has_hidden_element__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ./observers/has-hidden-element */ \"./src/js/observers/has-hidden-element.js\");\n/* harmony import */ var _observers_floating__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! ./observers/floating */ \"./src/js/observers/floating.js\");\n/* harmony import */ var _observers_without_behavior__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! ./observers/without-behavior */ \"./src/js/observers/without-behavior.js\");\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError(\"Cannot call a class as a function\"); } }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if (\"value\" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }\n\n/*\n* HSHeader Plugin\n* @version: 2.0.0 (Mon, 25 Nov 2019)\n* @requires: jQuery v3.0 or later\n* @author: HtmlStream\n* @event-namespace: .HSHeader\n* @license: Htmlstream Libraries (https://htmlstream.com/)\n* Copyright 2019 Htmlstream\n*/\n// Sticky\n // Moment Show / Hide\n\n // Show / Hide\n\n // Change Logo\n\n // Hide Section\n\n // Change Appearance\n\n // Has Hidden Element\n\n // Floating\n\n // Without Behavior\n\n\n\nvar HSHeader = /*#__PURE__*/function () {\n  function HSHeader(element, config, observers) {\n    _classCallCheck(this, HSHeader);\n\n    this.element = element;\n    this.config = config;\n    this.observers = observers && $.isPlainObject(observers) ? observers : {};\n    this.viewport = 'xs';\n    this.defaults = {\n      fixMoment: 0,\n      fixMomentClasses: null,\n      fixMomentExclude: null,\n      fixEffect: 'slide',\n      breakpoint: 'lg',\n      breakpointsMap: {\n        'md': 768,\n        'sm': 576,\n        'lg': 992,\n        'xl': 1200\n      },\n      effectCompensation: false,\n      effectCompensationStartClass: false,\n      effectCompensationEndClass: false\n    };\n  }\n\n  _createClass(HSHeader, [{\n    key: \"init\",\n    value: function init() {\n      var self = this,\n          element = this.element;\n      var dataSettings = element.attr('data-hs-header-options') ? JSON.parse(element.attr('data-hs-header-options')) : {};\n      if (!element || element.length !== 1 || element.data('HSHeader')) return;\n      this.config = $.extend(true, {}, this.defaults, dataSettings);\n\n      this._detectObservers();\n\n      this.fixMediaDifference(this.element);\n      this.checkViewport();\n      $(window).on('scroll.uHeader', function (e) {\n        window.HSHeader = null;\n\n        if ($(window).scrollTop() < self.config.fixMoment - 100 && self.config.effectCompensation === true) {\n          $(element).css({\n            top: -$(window).scrollTop()\n          }).addClass(self.config.effectCompensationStartClass).removeClass(self.config.effectCompensationEndClass);\n        } else if (self.config.effectCompensation === true) {\n          $(element).css({\n            top: 0\n          }).addClass(self.config.effectCompensationEndClass).removeClass(self.config.effectCompensationStartClass);\n        }\n\n        if ($(window).scrollTop() > 5 && !$(element).hasClass('scrolled')) {\n          $(element).addClass('scrolled');\n        }\n\n        if ($(window).scrollTop() < 5) {\n          $(element).removeClass('scrolled');\n        }\n\n        if (element.data('HSHeader')) {\n          self.notify();\n        }\n\n        element.data('HSHeader', this);\n      }).on('resize.uHeader', function (e) {\n        if (self.resizeTimeOutId) clearTimeout(self.resizeTimeOutId);\n        self.resizeTimeOutId = setTimeout(function () {\n          // self.checkViewport();\n          self.update();\n        }, 100);\n      }).trigger('scroll.uHeader');\n      return this.element;\n    }\n  }, {\n    key: \"header\",\n    value: function header(element, config, observers) {\n      if (!element || !element.length) return;\n      this.element = element;\n      this.config = config;\n      this.observers = observers && $.isPlainObject(observers) ? observers : {};\n      this.viewport = 'xs';\n      this.checkViewport();\n    }\n  }, {\n    key: \"_detectObservers\",\n    value: function _detectObservers() {\n      if (!this.element || !this.element.length) return;\n      var observers = this.observers = {\n        'xs': [],\n        'sm': [],\n        'md': [],\n        'lg': [],\n        'xl': []\n      };\n      /* ------------------------ xs -------------------------*/\n      // Has Hidden Element\n\n      if (this.element.hasClass('header-has-hidden-element')) {\n        observers['xs'].push(new _observers_has_hidden_element__WEBPACK_IMPORTED_MODULE_6__[\"default\"](this.element).init());\n      } // Sticky top\n\n\n      if (this.element.hasClass('header-sticky-top')) {\n        if (this.element.hasClass('header-show-hide')) {\n          observers['xs'].push(new _observers_moment_show_hide__WEBPACK_IMPORTED_MODULE_1__[\"default\"](this.element).init());\n        } else if (this.element.hasClass('header-toggle-section')) {\n          observers['xs'].push(new _observers_hide_section__WEBPACK_IMPORTED_MODULE_4__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo')) {\n          observers['xs'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-appearance')) {\n          observers['xs'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n      } // Floating\n\n\n      if (this.element.hasClass('header-floating')) {\n        observers['xs'].push(new _observers_floating__WEBPACK_IMPORTED_MODULE_7__[\"default\"](this.element).init());\n      }\n\n      if (this.element.hasClass('header-invulnerable')) {\n        observers['xs'].push(new _observers_without_behavior__WEBPACK_IMPORTED_MODULE_8__[\"default\"](this.element).init());\n      } // Sticky bottom\n\n\n      if (this.element.hasClass('header-sticky-bottom')) {\n        if (this.element.hasClass('header-change-appearance')) {\n          observers['xs'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo')) {\n          observers['xs'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n      } // Abs top & Static\n\n\n      if (this.element.hasClass('header-abs-top') || this.element.hasClass('header-static')) {\n        if (this.element.hasClass('header-show-hide')) {\n          observers['xs'].push(new _observers_show_hide__WEBPACK_IMPORTED_MODULE_2__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo')) {\n          observers['xs'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-appearance')) {\n          observers['xs'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n      } // Abs bottom & Abs top 2nd screen\n\n\n      if (this.element.hasClass('header-abs-bottom') || this.element.hasClass('header-abs-top-2nd-screen')) {\n        observers['xs'].push(new _observers_sticky__WEBPACK_IMPORTED_MODULE_0__[\"default\"](this.element).init());\n\n        if (this.element.hasClass('header-change-appearance')) {\n          observers['xs'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element, {\n            fixPointSelf: true\n          }).init());\n        }\n\n        if (this.element.hasClass('header-change-logo')) {\n          observers['xs'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element, {\n            fixPointSelf: true\n          }).init());\n        }\n      }\n      /* ------------------------ sm -------------------------*/\n      // Sticky top\n      // Has Hidden Element\n\n\n      if (this.element.hasClass('header-has-hidden-element-sm')) {\n        observers['sm'].push(new _observers_has_hidden_element__WEBPACK_IMPORTED_MODULE_6__[\"default\"](this.element).init());\n      }\n\n      if (this.element.hasClass('header-sticky-top-sm')) {\n        if (this.element.hasClass('header-show-hide-sm')) {\n          observers['sm'].push(new _observers_moment_show_hide__WEBPACK_IMPORTED_MODULE_1__[\"default\"](this.element).init());\n        } else if (this.element.hasClass('header-toggle-section-sm')) {\n          observers['sm'].push(new _observers_hide_section__WEBPACK_IMPORTED_MODULE_4__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-sm')) {\n          observers['sm'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-appearance-sm')) {\n          observers['sm'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n      } // Floating\n\n\n      if (this.element.hasClass('header-floating-sm')) {\n        observers['sm'].push(new _observers_floating__WEBPACK_IMPORTED_MODULE_7__[\"default\"](this.element).init());\n      }\n\n      if (this.element.hasClass('header-invulnerable-sm')) {\n        observers['sm'].push(new _observers_without_behavior__WEBPACK_IMPORTED_MODULE_8__[\"default\"](this.element).init());\n      } // Sticky bottom\n\n\n      if (this.element.hasClass('header-sticky-bottom-sm')) {\n        if (this.element.hasClass('header-change-appearance-sm')) {\n          observers['sm'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-sm')) {\n          observers['sm'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n      } // Abs top & Static\n\n\n      if (this.element.hasClass('header-abs-top-sm') || this.element.hasClass('header-static-sm')) {\n        if (this.element.hasClass('header-show-hide-sm')) {\n          observers['sm'].push(new _observers_show_hide__WEBPACK_IMPORTED_MODULE_2__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-sm')) {\n          observers['sm'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-appearance-sm')) {\n          observers['sm'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n      } // Abs bottom & Abs top 2nd screen\n\n\n      if (this.element.hasClass('header-abs-bottom-sm') || this.element.hasClass('header-abs-top-2nd-screen-sm')) {\n        observers['sm'].push(new _observers_sticky__WEBPACK_IMPORTED_MODULE_0__[\"default\"](this.element).init());\n\n        if (this.element.hasClass('header-change-appearance-sm')) {\n          observers['sm'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element, {\n            fixPointSelf: true\n          }).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-sm')) {\n          observers['sm'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element, {\n            fixPointSelf: true\n          }).init());\n        }\n      }\n      /* ------------------------ md -------------------------*/\n      // Has Hidden Element\n\n\n      if (this.element.hasClass('header-has-hidden-element-md')) {\n        observers['md'].push(new _observers_has_hidden_element__WEBPACK_IMPORTED_MODULE_6__[\"default\"](this.element).init());\n      } // Sticky top\n\n\n      if (this.element.hasClass('header-sticky-top-md')) {\n        if (this.element.hasClass('header-show-hide-md')) {\n          observers['md'].push(new _observers_moment_show_hide__WEBPACK_IMPORTED_MODULE_1__[\"default\"](this.element).init());\n        } else if (this.element.hasClass('header-toggle-section-md')) {\n          observers['md'].push(new _observers_hide_section__WEBPACK_IMPORTED_MODULE_4__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-md')) {\n          observers['md'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-appearance-md')) {\n          observers['md'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n      } // Floating\n\n\n      if (this.element.hasClass('header-floating-md')) {\n        observers['md'].push(new _observers_floating__WEBPACK_IMPORTED_MODULE_7__[\"default\"](this.element).init());\n      }\n\n      if (this.element.hasClass('header-invulnerable-md')) {\n        observers['md'].push(new _observers_without_behavior__WEBPACK_IMPORTED_MODULE_8__[\"default\"](this.element).init());\n      } // Sticky bottom\n\n\n      if (this.element.hasClass('header-sticky-bottom-md')) {\n        if (this.element.hasClass('header-change-appearance-md')) {\n          observers['md'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-md')) {\n          observers['md'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n      } // Abs top & Static\n\n\n      if (this.element.hasClass('header-abs-top-md') || this.element.hasClass('header-static-md')) {\n        if (this.element.hasClass('header-show-hide-md')) {\n          observers['md'].push(new _observers_show_hide__WEBPACK_IMPORTED_MODULE_2__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-md')) {\n          observers['md'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-appearance-md')) {\n          observers['md'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n      } // Abs bottom & Abs top 2nd screen\n\n\n      if (this.element.hasClass('header-abs-bottom-md') || this.element.hasClass('header-abs-top-2nd-screen-md')) {\n        observers['md'].push(new _observers_sticky__WEBPACK_IMPORTED_MODULE_0__[\"default\"](this.element).init());\n\n        if (this.element.hasClass('header-change-appearance-md')) {\n          observers['md'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element, {\n            fixPointSelf: true\n          }).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-md')) {\n          observers['md'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element, {\n            fixPointSelf: true\n          }).init());\n        }\n      }\n      /* ------------------------ lg -------------------------*/\n      // Has Hidden Element\n\n\n      if (this.element.hasClass('header-has-hidden-element-lg')) {\n        observers['lg'].push(new _observers_has_hidden_element__WEBPACK_IMPORTED_MODULE_6__[\"default\"](this.element).init());\n      } // Sticky top\n\n\n      if (this.element.hasClass('header-sticky-top-lg')) {\n        if (this.element.hasClass('header-show-hide-lg')) {\n          observers['lg'].push(new _observers_moment_show_hide__WEBPACK_IMPORTED_MODULE_1__[\"default\"](this.element).init());\n        } else if (this.element.hasClass('header-toggle-section-lg')) {\n          observers['lg'].push(new _observers_hide_section__WEBPACK_IMPORTED_MODULE_4__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-lg')) {\n          observers['lg'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-appearance-lg')) {\n          observers['lg'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n      } // Floating\n\n\n      if (this.element.hasClass('header-floating-lg')) {\n        observers['lg'].push(new _observers_floating__WEBPACK_IMPORTED_MODULE_7__[\"default\"](this.element).init());\n      }\n\n      if (this.element.hasClass('header-invulnerable-lg')) {\n        observers['lg'].push(new _observers_without_behavior__WEBPACK_IMPORTED_MODULE_8__[\"default\"](this.element).init());\n      } // Sticky bottom\n\n\n      if (this.element.hasClass('header-sticky-bottom-lg')) {\n        if (this.element.hasClass('header-change-appearance-lg')) {\n          observers['lg'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-lg')) {\n          observers['lg'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n      } // Abs top & Static\n\n\n      if (this.element.hasClass('header-abs-top-lg') || this.element.hasClass('header-static-lg')) {\n        if (this.element.hasClass('header-show-hide-lg')) {\n          observers['lg'].push(new _observers_show_hide__WEBPACK_IMPORTED_MODULE_2__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-lg')) {\n          observers['lg'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-appearance-lg')) {\n          observers['lg'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n      } // Abs bottom & Abs top 2nd screen\n\n\n      if (this.element.hasClass('header-abs-bottom-lg') || this.element.hasClass('header-abs-top-2nd-screen-lg')) {\n        observers['lg'].push(new _observers_sticky__WEBPACK_IMPORTED_MODULE_0__[\"default\"](this.element).init());\n\n        if (this.element.hasClass('header-change-appearance-lg')) {\n          observers['lg'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element, {\n            fixPointSelf: true\n          }).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-lg')) {\n          observers['lg'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element, {\n            fixPointSelf: true\n          }).init());\n        }\n      }\n      /* ------------------------ xl -------------------------*/\n      // Has Hidden Element\n\n\n      if (this.element.hasClass('header-has-hidden-element-xl')) {\n        observers['xl'].push(new _observers_has_hidden_element__WEBPACK_IMPORTED_MODULE_6__[\"default\"](this.element).init());\n      } // Sticky top\n\n\n      if (this.element.hasClass('header-sticky-top-xl')) {\n        if (this.element.hasClass('header-show-hide-xl')) {\n          observers['xl'].push(new _observers_moment_show_hide__WEBPACK_IMPORTED_MODULE_1__[\"default\"](this.element).init());\n        } else if (this.element.hasClass('header-toggle-section-xl')) {\n          observers['xl'].push(new _observers_hide_section__WEBPACK_IMPORTED_MODULE_4__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-xl')) {\n          observers['xl'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-appearance-xl')) {\n          observers['xl'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n      } // Floating\n\n\n      if (this.element.hasClass('header-floating-xl')) {\n        observers['xl'].push(new _observers_floating__WEBPACK_IMPORTED_MODULE_7__[\"default\"](this.element).init());\n      } // Sticky bottom\n\n\n      if (this.element.hasClass('header-invulnerable-xl')) {\n        observers['xl'].push(new _observers_without_behavior__WEBPACK_IMPORTED_MODULE_8__[\"default\"](this.element).init());\n      } // Sticky bottom\n\n\n      if (this.element.hasClass('header-sticky-bottom-xl')) {\n        if (this.element.hasClass('header-change-appearance-xl')) {\n          observers['xl'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-xl')) {\n          observers['xl'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n      } // Abs top & Static\n\n\n      if (this.element.hasClass('header-abs-top-xl') || this.element.hasClass('header-static-xl')) {\n        if (this.element.hasClass('header-show-hide-xl')) {\n          observers['xl'].push(new _observers_show_hide__WEBPACK_IMPORTED_MODULE_2__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-xl')) {\n          observers['xl'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element).init());\n        }\n\n        if (this.element.hasClass('header-change-appearance-xl')) {\n          observers['xl'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element).init());\n        }\n      } // Abs bottom & Abs top 2nd screen\n\n\n      if (this.element.hasClass('header-abs-bottom-xl') || this.element.hasClass('header-abs-top-2nd-screen-xl')) {\n        observers['xl'].push(new _observers_sticky__WEBPACK_IMPORTED_MODULE_0__[\"default\"](this.element).init());\n\n        if (this.element.hasClass('header-change-appearance-xl')) {\n          observers['xl'].push(new _observers_change_appearance__WEBPACK_IMPORTED_MODULE_5__[\"default\"](this.element, {\n            fixPointSelf: true\n          }).init());\n        }\n\n        if (this.element.hasClass('header-change-logo-xl')) {\n          observers['xl'].push(new _observers_change_logo__WEBPACK_IMPORTED_MODULE_3__[\"default\"](this.element, {\n            fixPointSelf: true\n          }).init());\n        }\n      }\n\n      return observers;\n    }\n  }, {\n    key: \"fixMediaDifference\",\n    value: function fixMediaDifference(element) {\n      if (!element || !element.length || !element.filter('[class*=\"header-side\"]').length) return;\n      var toggleable;\n\n      if (element.hasClass('header-side-left-xl') || element.hasClass('header-side-right-xl')) {\n        toggleable = element.find('.navbar-expand-xl');\n\n        if (toggleable.length) {\n          toggleable.removeClass('navbar-expand-xl').addClass('navbar-expand-lg');\n        }\n      } else if (element.hasClass('header-side-left-lg') || element.hasClass('header-side-right-lg')) {\n        toggleable = element.find('.navbar-expand-lg');\n\n        if (toggleable.length) {\n          toggleable.removeClass('navbar-expand-lg').addClass('navbar-expand-md');\n        }\n      } else if (element.hasClass('header-side-left-md') || element.hasClass('header-side-right-md')) {\n        toggleable = element.find('.navbar-expand-md');\n\n        if (toggleable.length) {\n          toggleable.removeClass('navbar-expand-md').addClass('navbar-expand-sm');\n        }\n      } else if (element.hasClass('header-side-left-sm') || element.hasClass('header-side-right-sm')) {\n        toggleable = element.find('.navbar-expand-sm');\n\n        if (toggleable.length) {\n          toggleable.removeClass('navbar-expand-sm').addClass('navbar-expand');\n        }\n      }\n    }\n  }, {\n    key: \"checkViewport\",\n    value: function checkViewport() {\n      var $w = $(window);\n\n      if ($w.width() > this.config.breakpointsMap['sm'] && this.observers['sm'].length) {\n        this.prevViewport = this.viewport;\n        this.viewport = 'sm';\n\n        if (this.config.fixMoment && $w.scrollTop() > this.config.fixMoment) {\n          if (typeof this.config.breakpointsMap['sm'] === 'undefined') {\n            this.element.removeClass('js-header-fix-moment');\n          } else {\n            this.element.addClass('js-header-fix-moment');\n          }\n        }\n\n        return this;\n      }\n\n      if ($w.width() > this.config.breakpointsMap['md'] && this.observers['md'].length) {\n        this.prevViewport = this.viewport;\n        this.viewport = 'md';\n\n        if (this.config.fixMoment && $w.scrollTop() > this.config.fixMoment) {\n          if (typeof this.config.breakpointsMap['md'] === 'undefined') {\n            this.element.removeClass('js-header-fix-moment');\n          } else {\n            this.element.addClass('js-header-fix-moment');\n          }\n        }\n\n        return this;\n      }\n\n      if ($w.width() > this.config.breakpointsMap['lg'] && this.observers['lg'].length) {\n        this.prevViewport = this.viewport;\n        this.viewport = 'lg';\n\n        if (this.config.fixMoment && $w.scrollTop() > this.config.fixMoment) {\n          if (typeof this.config.breakpointsMap['lg'] === 'undefined') {\n            this.element.removeClass('js-header-fix-moment');\n          } else {\n            this.element.addClass('js-header-fix-moment');\n          }\n        }\n\n        return this;\n      }\n\n      if ($w.width() > this.config.breakpointsMap['xl'] && this.observers['xl'].length) {\n        this.prevViewport = this.viewport;\n        this.viewport = 'xl';\n\n        if (this.config.fixMoment && $w.scrollTop() > this.config.fixMoment) {\n          if (typeof this.config.breakpointsMap['xl'] === 'undefined') {\n            this.element.removeClass('js-header-fix-moment');\n          } else {\n            this.element.addClass('js-header-fix-moment');\n          }\n        }\n\n        return this;\n      }\n\n      if (this.prevViewport) this.prevViewport = this.viewport;\n\n      if (this.config.fixMoment && $w.scrollTop() > this.config.fixMoment) {\n        if (typeof this.config.breakpointsMap['xs'] === 'undefined') {\n          this.element.removeClass('js-header-fix-moment');\n        } else {\n          this.element.addClass('js-header-fix-moment');\n        }\n      }\n\n      this.viewport = 'xs';\n      return this;\n    }\n  }, {\n    key: \"notify\",\n    value: function notify() {\n      if (this.prevViewport) {\n        this.observers[this.prevViewport].forEach(function (observer) {\n          observer.destroy();\n        });\n        this.prevViewport = null;\n      }\n\n      this.observers[this.viewport].forEach(function (observer) {\n        observer.check();\n      });\n      return this;\n    }\n  }, {\n    key: \"update\",\n    value: function update() {\n      for (var viewport in this.observers) {\n        this.observers[viewport].forEach(function (observer) {\n          observer.destroy();\n        });\n      }\n\n      this.prevViewport = null;\n      this.observers[this.viewport].forEach(function (observer) {\n        observer.reinit();\n      });\n      return this;\n    }\n  }]);\n\n  return HSHeader;\n}();\n\n\n\n//# sourceURL=webpack://HSHeader/./src/js/hs-header.js?")
        }, "./src/js/observers/abstract.js": function (module, __webpack_exports__, __webpack_require__) {
            "use strict";
            eval('__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return HSAbstractObserver; });\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }\n\nvar HSAbstractObserver = /*#__PURE__*/function () {\n  function HSAbstractObserver(element) {\n    _classCallCheck(this, HSAbstractObserver);\n\n    this.element = element;\n    this.defaultState = true;\n  }\n\n  _createClass(HSAbstractObserver, [{\n    key: "reinit",\n    value: function reinit() {\n      this.destroy().init().check();\n    }\n  }]);\n\n  return HSAbstractObserver;\n}();\n\n\n\n//# sourceURL=webpack://HSHeader/./src/js/observers/abstract.js?')
        }, "./src/js/observers/change-appearance.js": function (module, __webpack_exports__, __webpack_require__) {
            "use strict";
            eval('__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return HSHeaderChangeAppearanceObserver; });\n/* harmony import */ var _abstract__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./abstract */ "./src/js/observers/abstract.js");\nfunction _typeof(obj) { "@babel/helpers - typeof"; if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }\n\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }\n\nfunction _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }\n\nfunction _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn\'t been initialised - super() hasn\'t been called"); } return self; }\n\nfunction _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }\n\nfunction _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }\n\nfunction _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }\n\n\n\nvar HSHeaderChangeAppearanceObserver = /*#__PURE__*/function (_HSAbstractObserver) {\n  _inherits(HSHeaderChangeAppearanceObserver, _HSAbstractObserver);\n\n  function HSHeaderChangeAppearanceObserver(element) {\n    var _this;\n\n    _classCallCheck(this, HSHeaderChangeAppearanceObserver);\n\n    _this = _possibleConstructorReturn(this, _getPrototypeOf(HSHeaderChangeAppearanceObserver).call(this, element));\n    _this.config = {\n      fixPointSelf: false\n    };\n    _this.dataSettings = _this.element.attr(\'data-hs-header-options\') ? JSON.parse(_this.element.attr(\'data-hs-header-options\')) : {};\n    return _this;\n  }\n\n  _createClass(HSHeaderChangeAppearanceObserver, [{\n    key: "init",\n    value: function init() {\n      if (this.element.hasClass(\'js-header-fix-moment\')) {\n        this.hasFixedClass = true;\n        this.element.removeClass(\'js-header-fix-moment\');\n      }\n\n      if (this.config.fixPointSelf) {\n        this.offset = this.element.offset().top;\n      } else {\n        this.offset = isFinite(this.dataSettings.fixMoment) ? this.dataSettings.fixMoment : 5;\n      }\n\n      if (this.hasFixedClass) {\n        this.hasFixedClass = false;\n        this.element.addClass(\'js-header-fix-moment\');\n      }\n\n      this.sections = this.element.find(\'[data-hs-header-item-options]\');\n      this.defaultState = true;\n      return this;\n    }\n  }, {\n    key: "destroy",\n    value: function destroy() {\n      this.toDefaultState();\n      return this;\n    }\n  }, {\n    key: "check",\n    value: function check() {\n      if (!this.sections.length) return this;\n      var $w = $(window),\n          docScrolled = $w.scrollTop();\n\n      if (docScrolled > this.offset && this.defaultState) {\n        this.changeState();\n      } else if (docScrolled <= this.offset && !this.defaultState) {\n        this.toDefaultState();\n      }\n\n      return this;\n    }\n  }, {\n    key: "changeState",\n    value: function changeState() {\n      this.sections.each(function (i, el) {\n        var $this = $(el),\n            dataSettings = $this.attr(\'data-hs-header-item-options\') ? JSON.parse($this.attr(\'data-hs-header-item-options\')) : {},\n            classes = dataSettings.fixMomentClasses,\n            exclude = dataSettings.fixMomentExclude;\n        if (!classes && !exclude) return;\n        $this.addClass(classes + \' js-header-change-moment\');\n        $this.removeClass(exclude);\n      });\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }, {\n    key: "toDefaultState",\n    value: function toDefaultState() {\n      this.sections.each(function (i, el) {\n        var $this = $(el),\n            dataSettings = $this.attr(\'data-hs-header-item-options\') ? JSON.parse($this.attr(\'data-hs-header-item-options\')) : {},\n            classes = dataSettings.fixMomentClasses,\n            exclude = dataSettings.fixMomentExclude;\n        if (!classes && !exclude) return;\n        $this.removeClass(classes + \' js-header-change-moment\');\n        $this.addClass(exclude);\n      });\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }]);\n\n  return HSHeaderChangeAppearanceObserver;\n}(_abstract__WEBPACK_IMPORTED_MODULE_0__["default"]);\n\n\n\n//# sourceURL=webpack://HSHeader/./src/js/observers/change-appearance.js?')
        }, "./src/js/observers/change-logo.js": function (module, __webpack_exports__, __webpack_require__) {
            "use strict";
            eval('__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return HSHeaderChangeLogoObserver; });\n/* harmony import */ var _abstract__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./abstract */ "./src/js/observers/abstract.js");\nfunction _typeof(obj) { "@babel/helpers - typeof"; if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }\n\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }\n\nfunction _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }\n\nfunction _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn\'t been initialised - super() hasn\'t been called"); } return self; }\n\nfunction _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }\n\nfunction _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }\n\nfunction _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }\n\n\n\nvar HSHeaderChangeLogoObserver = /*#__PURE__*/function (_HSAbstractObserver) {\n  _inherits(HSHeaderChangeLogoObserver, _HSAbstractObserver);\n\n  function HSHeaderChangeLogoObserver(element) {\n    var _this;\n\n    _classCallCheck(this, HSHeaderChangeLogoObserver);\n\n    _this = _possibleConstructorReturn(this, _getPrototypeOf(HSHeaderChangeLogoObserver).call(this, element));\n    _this.config = {\n      fixPointSelf: false\n    };\n    _this.dataSettings = _this.element.attr(\'data-hs-header-options\') ? JSON.parse(_this.element.attr(\'data-hs-header-options\')) : {};\n    return _this;\n  }\n\n  _createClass(HSHeaderChangeLogoObserver, [{\n    key: "init",\n    value: function init() {\n      if (this.element.hasClass(\'js-header-fix-moment\')) {\n        this.hasFixedClass = true;\n        this.element.removeClass(\'js-header-fix-moment\');\n      }\n\n      if (this.config.fixPointSelf) {\n        this.offset = this.element.offset().top;\n      } else {\n        this.offset = isFinite(this.dataSettings.fixMoment) ? this.dataSettings.fixMoment : 0;\n      }\n\n      if (this.hasFixedClass) {\n        this.hasFixedClass = false;\n        this.element.addClass(\'js-header-fix-moment\');\n      }\n\n      this.imgs = this.element.find(\'.header-logo-img\');\n      this.defaultState = true;\n      this.mainLogo = this.imgs.filter(\'.header-logo-img-main\');\n      this.additionalLogo = this.imgs.not(\'.header-logo-img-main\');\n      if (!this.imgs.length) return this;\n      return this;\n    }\n  }, {\n    key: "destroy",\n    value: function destroy() {\n      this.toDefaultState();\n      return this;\n    }\n  }, {\n    key: "check",\n    value: function check() {\n      var $w = $(window);\n      if (!this.imgs.length) return this;\n\n      if ($w.scrollTop() > this.offset && this.defaultState) {\n        this.changeState();\n      } else if ($w.scrollTop() <= this.offset && !this.defaultState) {\n        this.toDefaultState();\n      }\n\n      return this;\n    }\n  }, {\n    key: "changeState",\n    value: function changeState() {\n      if (this.mainLogo.length) {\n        this.mainLogo.removeClass(\'header-logo-img-main\');\n      }\n\n      if (this.additionalLogo.length) {\n        this.additionalLogo.addClass(\'header-logo-img-main\');\n      }\n\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }, {\n    key: "toDefaultState",\n    value: function toDefaultState() {\n      if (this.mainLogo.length) {\n        this.mainLogo.addClass(\'header-logo-img-main\');\n      }\n\n      if (this.additionalLogo.length) {\n        this.additionalLogo.removeClass(\'header-logo-img-main\');\n      }\n\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }]);\n\n  return HSHeaderChangeLogoObserver;\n}(_abstract__WEBPACK_IMPORTED_MODULE_0__["default"]);\n\n\n\n//# sourceURL=webpack://HSHeader/./src/js/observers/change-logo.js?')
        }, "./src/js/observers/floating.js": function (module, __webpack_exports__, __webpack_require__) {
            "use strict";
            eval('__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return HSHeaderFloatingObserver; });\n/* harmony import */ var _abstract__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./abstract */ "./src/js/observers/abstract.js");\nfunction _typeof(obj) { "@babel/helpers - typeof"; if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }\n\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }\n\nfunction _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }\n\nfunction _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn\'t been initialised - super() hasn\'t been called"); } return self; }\n\nfunction _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }\n\nfunction _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }\n\nfunction _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }\n\n\n\nvar HSHeaderFloatingObserver = /*#__PURE__*/function (_HSAbstractObserver) {\n  _inherits(HSHeaderFloatingObserver, _HSAbstractObserver);\n\n  function HSHeaderFloatingObserver(element) {\n    var _this;\n\n    _classCallCheck(this, HSHeaderFloatingObserver);\n\n    _this = _possibleConstructorReturn(this, _getPrototypeOf(HSHeaderFloatingObserver).call(this, element));\n    _this.dataSettings = _this.element.attr(\'data-hs-header-options\') ? JSON.parse(_this.element.attr(\'data-hs-header-options\')) : {};\n    return _this;\n  }\n\n  _createClass(HSHeaderFloatingObserver, [{\n    key: "init",\n    value: function init() {\n      this.offset = this.element.offset().top;\n      this.sections = this.element.find(\'.header-section\');\n      this.defaultState = true;\n      return this;\n    }\n  }, {\n    key: "destroy",\n    value: function destroy() {\n      this.toDefaultState();\n      return this;\n    }\n  }, {\n    key: "check",\n    value: function check() {\n      var $w = $(window),\n          docScrolled = $w.scrollTop();\n\n      if (docScrolled > this.offset && this.defaultState) {\n        this.changeState();\n      } else if (docScrolled <= this.offset && !this.defaultState) {\n        this.toDefaultState();\n      }\n\n      return this;\n    }\n  }, {\n    key: "changeState",\n    value: function changeState() {\n      this.element.addClass(\'js-header-fix-moment\').addClass(this.dataSettings.fixMomentClasses).removeClass(this.dataSettings.fixMomentExclude);\n\n      if (this.sections.length) {\n        this.sections.each(function (i, el) {\n          var $section = $(el),\n              dataSettings = $section.attr(\'data-hs-header-item-options\') ? JSON.parse($section.attr(\'data-hs-header-item-options\')) : {};\n          $section.addClass(dataSettings.fixMomentClasses).removeClass(dataSettings.fixMomentExclude);\n        });\n      }\n\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }, {\n    key: "toDefaultState",\n    value: function toDefaultState() {\n      this.element.removeClass(\'js-header-fix-moment\').removeClass(this.dataSettings.fixMomentClasses).addClass(this.dataSettings.fixMomentExclude);\n\n      if (this.sections.length) {\n        this.sections.each(function (i, el) {\n          var $section = $(el),\n              dataSettings = $section.attr(\'data-hs-header-item-options\') ? JSON.parse($section.attr(\'data-hs-header-item-options\')) : {};\n          $section.addClass(dataSettings.fixMomentClasses).removeClass(dataSettings.fixMomentExclude);\n        });\n      }\n\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }]);\n\n  return HSHeaderFloatingObserver;\n}(_abstract__WEBPACK_IMPORTED_MODULE_0__["default"]);\n\n\n\n//# sourceURL=webpack://HSHeader/./src/js/observers/floating.js?')
        }, "./src/js/observers/has-hidden-element.js": function (module, __webpack_exports__, __webpack_require__) {
            "use strict";
            eval('__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return HSHeaderHasHiddenElement; });\n/* harmony import */ var _abstract__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./abstract */ "./src/js/observers/abstract.js");\nfunction _typeof(obj) { "@babel/helpers - typeof"; if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }\n\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }\n\nfunction _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }\n\nfunction _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn\'t been initialised - super() hasn\'t been called"); } return self; }\n\nfunction _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }\n\nfunction _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }\n\nfunction _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }\n\n\n\nvar HSHeaderHasHiddenElement = /*#__PURE__*/function (_HSAbstractObserver) {\n  _inherits(HSHeaderHasHiddenElement, _HSAbstractObserver);\n\n  function HSHeaderHasHiddenElement(element) {\n    var _this;\n\n    _classCallCheck(this, HSHeaderHasHiddenElement);\n\n    _this = _possibleConstructorReturn(this, _getPrototypeOf(HSHeaderHasHiddenElement).call(this, element));\n    _this.config = {\n      animated: true\n    };\n    _this.dataSettings = _this.element.attr(\'data-hs-header-options\') ? JSON.parse(_this.element.attr(\'data-hs-header-options\')) : {};\n    return _this;\n  }\n\n  _createClass(HSHeaderHasHiddenElement, [{\n    key: "init",\n    value: function init() {\n      this.offset = isFinite(this.dataSettings.fixMoment) ? this.dataSettings.fixMoment : 5;\n      this.elements = this.element.find(\'.header-hidden-element\');\n      this.defaultState = true;\n      return this;\n    }\n  }, {\n    key: "destroy",\n    value: function destroy() {\n      this.toDefaultState();\n      return this;\n    }\n  }, {\n    key: "check",\n    value: function check() {\n      if (!this.elements.length) return this;\n      var $w = $(window),\n          docScrolled = $w.scrollTop();\n\n      if (docScrolled > this.offset && this.defaultState) {\n        this.changeState();\n      } else if (docScrolled <= this.offset && !this.defaultState) {\n        this.toDefaultState();\n      }\n\n      return this;\n    }\n  }, {\n    key: "changeState",\n    value: function changeState() {\n      if (this.config.animated) {\n        this.elements.stop().slideUp();\n      } else {\n        this.elements.hide();\n      }\n\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }, {\n    key: "toDefaultState",\n    value: function toDefaultState() {\n      if (this.config.animated) {\n        this.elements.stop().slideDown();\n      } else {\n        this.elements.show();\n      }\n\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }]);\n\n  return HSHeaderHasHiddenElement;\n}(_abstract__WEBPACK_IMPORTED_MODULE_0__["default"]);\n\n\n\n//# sourceURL=webpack://HSHeader/./src/js/observers/has-hidden-element.js?')
        }, "./src/js/observers/hide-section.js": function (module, __webpack_exports__, __webpack_require__) {
            "use strict";
            eval('__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return HSHeaderHideSectionObserver; });\n/* harmony import */ var _abstract__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./abstract */ "./src/js/observers/abstract.js");\nfunction _typeof(obj) { "@babel/helpers - typeof"; if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }\n\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }\n\nfunction _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }\n\nfunction _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn\'t been initialised - super() hasn\'t been called"); } return self; }\n\nfunction _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }\n\nfunction _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }\n\nfunction _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }\n\n\n\nvar HSHeaderHideSectionObserver = /*#__PURE__*/function (_HSAbstractObserver) {\n  _inherits(HSHeaderHideSectionObserver, _HSAbstractObserver);\n\n  function HSHeaderHideSectionObserver(element) {\n    var _this;\n\n    _classCallCheck(this, HSHeaderHideSectionObserver);\n\n    _this = _possibleConstructorReturn(this, _getPrototypeOf(HSHeaderHideSectionObserver).call(this, element));\n    _this.dataSettings = _this.element.attr(\'data-hs-header-options\') ? JSON.parse(_this.element.attr(\'data-hs-header-options\')) : {};\n    return _this;\n  }\n\n  _createClass(HSHeaderHideSectionObserver, [{\n    key: "init",\n    value: function init() {\n      this.offset = isFinite(this.dataSettings.fixMoment) ? this.dataSettings.fixMoment : 5;\n      this.section = this.element.find(\'.header-section-hidden\');\n      this.defaultState = true;\n      this.sectionHeight = this.section.length ? this.section.outerHeight() : 0;\n      return this;\n    }\n  }, {\n    key: "destroy",\n    value: function destroy() {\n      if (this.section.length) {\n        this.element.css({\n          \'margin-top\': 0\n        });\n      }\n\n      return this;\n    }\n  }, {\n    key: "check",\n    value: function check() {\n      if (!this.section.length) return this;\n      var $w = $(window),\n          docScrolled = $w.scrollTop();\n\n      if (docScrolled > this.offset && this.defaultState) {\n        this.changeState();\n      } else if (docScrolled <= this.offset && !this.defaultState) {\n        this.toDefaultState();\n      }\n\n      return this;\n    }\n  }, {\n    key: "changeState",\n    value: function changeState() {\n      var self = this;\n      this.element.stop().animate({\n        \'margin-top\': self.sectionHeight * -1 - 1 // last \'-1\' is a small fix\n\n      });\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }, {\n    key: "toDefaultState",\n    value: function toDefaultState() {\n      this.element.stop().animate({\n        \'margin-top\': 0\n      });\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }]);\n\n  return HSHeaderHideSectionObserver;\n}(_abstract__WEBPACK_IMPORTED_MODULE_0__["default"]);\n\n\n\n//# sourceURL=webpack://HSHeader/./src/js/observers/hide-section.js?')
        }, "./src/js/observers/moment-show-hide.js": function (module, __webpack_exports__, __webpack_require__) {
            "use strict";
            eval('__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return HSHeaderMomentShowHideObserver; });\n/* harmony import */ var _abstract__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./abstract */ "./src/js/observers/abstract.js");\nfunction _typeof(obj) { "@babel/helpers - typeof"; if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }\n\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }\n\nfunction _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }\n\nfunction _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn\'t been initialised - super() hasn\'t been called"); } return self; }\n\nfunction _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }\n\nfunction _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }\n\nfunction _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }\n\n\n\nvar HSHeaderMomentShowHideObserver = /*#__PURE__*/function (_HSAbstractObserver) {\n  _inherits(HSHeaderMomentShowHideObserver, _HSAbstractObserver);\n\n  function HSHeaderMomentShowHideObserver(element) {\n    var _this;\n\n    _classCallCheck(this, HSHeaderMomentShowHideObserver);\n\n    _this = _possibleConstructorReturn(this, _getPrototypeOf(HSHeaderMomentShowHideObserver).call(this, element));\n    _this.dataSettings = _this.element.attr(\'data-hs-header-options\') ? JSON.parse(_this.element.attr(\'data-hs-header-options\')) : {};\n    return _this;\n  }\n\n  _createClass(HSHeaderMomentShowHideObserver, [{\n    key: "init",\n    value: function init() {\n      this.direction = \'down\';\n      this.delta = 0;\n      this.defaultState = true;\n      this.offset = isFinite(this.dataSettings.fixMoment) && this.dataSettings.fixMoment !== 0 ? this.dataSettings.fixMoment : 5;\n      this.effect = this.dataSettings.fixEffect ? this.dataSettings.fixEffect : \'show-hide\';\n      return this;\n    }\n  }, {\n    key: "destroy",\n    value: function destroy() {\n      this.toDefaultState();\n      return this;\n    }\n  }, {\n    key: "checkDirection",\n    value: function checkDirection() {\n      if ($(window).scrollTop() > this.delta) {\n        this.direction = \'down\';\n      } else {\n        this.direction = \'up\';\n      }\n\n      this.delta = $(window).scrollTop();\n      return this;\n    }\n  }, {\n    key: "toDefaultState",\n    value: function toDefaultState() {\n      switch (this.effect) {\n        case \'slide\':\n          this.element.removeClass(\'header-moved-up\');\n          break;\n\n        case \'fade\':\n          this.element.removeClass(\'header-faded\');\n          break;\n\n        default:\n          this.element.removeClass(\'header-invisible\');\n      }\n\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }, {\n    key: "changeState",\n    value: function changeState() {\n      switch (this.effect) {\n        case \'slide\':\n          this.element.addClass(\'header-moved-up\');\n          break;\n\n        case \'fade\':\n          this.element.addClass(\'header-faded\');\n          break;\n\n        default:\n          this.element.addClass(\'header-invisible\');\n      }\n\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }, {\n    key: "check",\n    value: function check() {\n      var docScrolled = $(window).scrollTop();\n      this.checkDirection();\n\n      if (docScrolled >= this.offset && this.defaultState && this.direction === \'down\') {\n        this.changeState();\n      } else if (!this.defaultState && this.direction === \'up\') {\n        this.toDefaultState();\n      }\n\n      return this;\n    }\n  }]);\n\n  return HSHeaderMomentShowHideObserver;\n}(_abstract__WEBPACK_IMPORTED_MODULE_0__["default"]);\n\n\n\n//# sourceURL=webpack://HSHeader/./src/js/observers/moment-show-hide.js?')
        }, "./src/js/observers/show-hide.js": function (module, __webpack_exports__, __webpack_require__) {
            "use strict";
            eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"default\", function() { return HSHeaderShowHideObserver; });\n/* harmony import */ var _abstract__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./abstract */ \"./src/js/observers/abstract.js\");\nfunction _typeof(obj) { \"@babel/helpers - typeof\"; if (typeof Symbol === \"function\" && typeof Symbol.iterator === \"symbol\") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === \"function\" && obj.constructor === Symbol && obj !== Symbol.prototype ? \"symbol\" : typeof obj; }; } return _typeof(obj); }\n\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError(\"Cannot call a class as a function\"); } }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if (\"value\" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }\n\nfunction _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === \"object\" || typeof call === \"function\")) { return call; } return _assertThisInitialized(self); }\n\nfunction _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError(\"this hasn't been initialised - super() hasn't been called\"); } return self; }\n\nfunction _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }\n\nfunction _inherits(subClass, superClass) { if (typeof superClass !== \"function\" && superClass !== null) { throw new TypeError(\"Super expression must either be null or a function\"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }\n\nfunction _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }\n\n\n\nvar HSHeaderShowHideObserver = /*#__PURE__*/function (_HSAbstractObserver) {\n  _inherits(HSHeaderShowHideObserver, _HSAbstractObserver);\n\n  function HSHeaderShowHideObserver(element) {\n    var _this;\n\n    _classCallCheck(this, HSHeaderShowHideObserver);\n\n    _this = _possibleConstructorReturn(this, _getPrototypeOf(HSHeaderShowHideObserver).call(this, element));\n    _this.dataSettings = _this.element.attr('data-hs-header-options') ? JSON.parse(_this.element.attr('data-hs-header-options')) : {};\n    return _this;\n  }\n\n  _createClass(HSHeaderShowHideObserver, [{\n    key: \"init\",\n    value: function init() {\n      if (!this.defaultState && $(window).scrollTop() > this.offset) return this;\n      this.defaultState = true;\n      this.transitionDuration = parseFloat(getComputedStyle(this.element.get(0))['transition-duration'], 10) * 1000;\n      this.offset = isFinite(this.dataSettings.fixMoment) && this.dataSettings.fixMoment > this.element.outerHeight() ? this.dataSettings.fixMoment : this.element.outerHeight() + 100;\n      this.effect = this.dataSettings.fixEffect ? this.dataSettings.fixEffect : 'show-hide';\n      return this;\n    }\n  }, {\n    key: \"destroy\",\n    value: function destroy() {\n      if (!this.defaultState && $(window).scrollTop() > this.offset) return this;\n      this.element.removeClass('header-untransitioned');\n\n      this._removeCap();\n\n      return this;\n    }\n  }, {\n    key: \"check\",\n    value: function check() {\n      var $w = $(window);\n\n      if ($w.scrollTop() > this.element.outerHeight() && !this.capInserted) {\n        this._insertCap();\n      } else if ($w.scrollTop() <= this.element.outerHeight() && this.capInserted) {\n        this._removeCap();\n      }\n\n      if ($w.scrollTop() > this.offset && this.defaultState) {\n        this.changeState();\n      } else if ($w.scrollTop() <= this.offset && !this.defaultState) {\n        this.toDefaultState();\n      }\n    }\n  }, {\n    key: \"changeState\",\n    value: function changeState() {\n      this.element.removeClass('header-untransitioned');\n      if (this.animationTimeoutId) clearTimeout(this.animationTimeoutId);\n\n      switch (this.effect) {\n        case 'fade':\n          this.element.removeClass('header-faded');\n          break;\n\n        case 'slide':\n          this.element.removeClass('header-moved-up');\n          break;\n\n        default:\n          this.element.removeClass('header-invisible');\n      }\n\n      this.defaultState = !this.defaultState;\n    }\n  }, {\n    key: \"toDefaultState\",\n    value: function toDefaultState() {\n      var self = this;\n      this.animationTimeoutId = setTimeout(function () {\n        self.element.addClass('header-untransitioned');\n      }, this.transitionDuration);\n\n      switch (this.effect) {\n        case 'fade':\n          this.element.addClass('header-faded');\n          break;\n\n        case 'slide':\n          this.element.addClass('header-moved-up');\n          break;\n\n        default:\n          this.element.addClass('header-invisible');\n      }\n\n      this.defaultState = !this.defaultState;\n    }\n  }, {\n    key: \"_insertCap\",\n    value: function _insertCap() {\n      this.element.addClass('js-header-fix-moment header-untransitioned');\n\n      if (this.element.hasClass('header-static')) {\n        $('html').css('padding-top', this.element.outerHeight());\n      }\n\n      switch (this.effect) {\n        case 'fade':\n          this.element.addClass('header-faded');\n          break;\n\n        case 'slide':\n          this.element.addClass('header-moved-up');\n          break;\n\n        default:\n          this.element.addClass('header-invisible');\n      }\n\n      this.capInserted = true;\n    }\n  }, {\n    key: \"_removeCap\",\n    value: function _removeCap() {\n      var self = this;\n      this.element.removeClass('js-header-fix-moment');\n\n      if (this.element.hasClass('header-static')) {\n        $('html').css('padding-top', 0);\n      }\n\n      if (this.removeCapTimeOutId) clearTimeout(this.removeCapTimeOutId);\n      this.removeCapTimeOutId = setTimeout(function () {\n        self.element.removeClass('header-moved-up header-faded header-invisible');\n      }, 10);\n      this.capInserted = false;\n    }\n  }]);\n\n  return HSHeaderShowHideObserver;\n}(_abstract__WEBPACK_IMPORTED_MODULE_0__[\"default\"]);\n\n\n\n//# sourceURL=webpack://HSHeader/./src/js/observers/show-hide.js?")
        }, "./src/js/observers/sticky.js": function (module, __webpack_exports__, __webpack_require__) {
            "use strict";
            eval('__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return HSHeaderStickObserver; });\n/* harmony import */ var _abstract__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./abstract */ "./src/js/observers/abstract.js");\nfunction _typeof(obj) { "@babel/helpers - typeof"; if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }\n\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }\n\nfunction _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }\n\nfunction _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn\'t been initialised - super() hasn\'t been called"); } return self; }\n\nfunction _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }\n\nfunction _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }\n\nfunction _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }\n\n\n\nvar HSHeaderStickObserver = /*#__PURE__*/function (_HSAbstractObserver) {\n  _inherits(HSHeaderStickObserver, _HSAbstractObserver);\n\n  function HSHeaderStickObserver(element) {\n    _classCallCheck(this, HSHeaderStickObserver);\n\n    return _possibleConstructorReturn(this, _getPrototypeOf(HSHeaderStickObserver).call(this, element));\n  }\n\n  _createClass(HSHeaderStickObserver, [{\n    key: "init",\n    value: function init() {\n      this.defaultState = true;\n      this.offset = this.element.offset().top;\n      return this;\n    }\n  }, {\n    key: "destroy",\n    value: function destroy() {\n      this.toDefaultState();\n      return this;\n    }\n  }, {\n    key: "check",\n    value: function check() {\n      var $w = $(window),\n          docScrolled = $w.scrollTop();\n\n      if (docScrolled > this.offset && this.defaultState) {\n        this.changeState();\n      } else if (docScrolled < this.offset && !this.defaultState) {\n        this.toDefaultState();\n      }\n\n      return this;\n    }\n  }, {\n    key: "changeState",\n    value: function changeState() {\n      this.element.addClass(\'js-header-fix-moment\');\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }, {\n    key: "toDefaultState",\n    value: function toDefaultState() {\n      this.element.removeClass(\'js-header-fix-moment\');\n      this.defaultState = !this.defaultState;\n      return this;\n    }\n  }]);\n\n  return HSHeaderStickObserver;\n}(_abstract__WEBPACK_IMPORTED_MODULE_0__["default"]);\n\n\n\n//# sourceURL=webpack://HSHeader/./src/js/observers/sticky.js?')
        }, "./src/js/observers/without-behavior.js": function (module, __webpack_exports__, __webpack_require__) {
            "use strict";
            eval('__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "default", function() { return HSHeaderWithoutBehaviorObserver; });\n/* harmony import */ var _abstract__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./abstract */ "./src/js/observers/abstract.js");\nfunction _typeof(obj) { "@babel/helpers - typeof"; if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }\n\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }\n\nfunction _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }\n\nfunction _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn\'t been initialised - super() hasn\'t been called"); } return self; }\n\nfunction _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }\n\nfunction _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }\n\nfunction _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }\n\n\n\nvar HSHeaderWithoutBehaviorObserver = /*#__PURE__*/function (_HSAbstractObserver) {\n  _inherits(HSHeaderWithoutBehaviorObserver, _HSAbstractObserver);\n\n  function HSHeaderWithoutBehaviorObserver(element) {\n    _classCallCheck(this, HSHeaderWithoutBehaviorObserver);\n\n    return _possibleConstructorReturn(this, _getPrototypeOf(HSHeaderWithoutBehaviorObserver).call(this, element));\n  }\n\n  _createClass(HSHeaderWithoutBehaviorObserver, [{\n    key: "init",\n    value: function init() {\n      return this;\n    }\n  }, {\n    key: "check",\n    value: function check() {\n      return this;\n    }\n  }, {\n    key: "destroy",\n    value: function destroy() {\n      return this;\n    }\n  }, {\n    key: "changeState",\n    value: function changeState() {\n      return this;\n    }\n  }, {\n    key: "toDefaultState",\n    value: function toDefaultState() {\n      return this;\n    }\n  }]);\n\n  return HSHeaderWithoutBehaviorObserver;\n}(_abstract__WEBPACK_IMPORTED_MODULE_0__["default"]);\n\n\n\n//# sourceURL=webpack://HSHeader/./src/js/observers/without-behavior.js?')
        }
    }, e = {}, f.m = d, f.c = e, f.d = function (e, t, n) {
        f.o(e, t) || Object.defineProperty(e, t, {enumerable: !0, get: n})
    }, f.r = function (e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {value: "Module"}), Object.defineProperty(e, "__esModule", {value: !0})
    }, f.t = function (e, t) {
        if (1 & t && (e = f(e)), 8 & t) return e;
        if (4 & t && "object" == typeof e && e && e.__esModule) return e;
        var n = Object.create(null);
        if (f.r(n), Object.defineProperty(n, "default", {
            enumerable: !0,
            value: e
        }), 2 & t && "string" != typeof e) for (var s in e) f.d(n, s, function (t) {
            return e[t]
        }.bind(null, s));
        return n
    }, f.n = function (e) {
        var t = e && e.__esModule ? function () {
            return e.default
        } : function () {
            return e
        };
        return f.d(t, "a", t), t
    }, f.o = function (e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, f.p = "", f(f.s = "./src/js/hs-header.js").default;

    function f(t) {
        if (e[t]) return e[t].exports;
        var n = e[t] = {i: t, l: !1, exports: {}};
        return d[t].call(n.exports, n, n.exports, f), n.l = !0, n.exports
    }

    var d, e
}), function (e, t) {
    "object" == typeof exports && "object" == typeof module ? module.exports = t() : "function" == typeof define && define.amd ? define([], t) : "object" == typeof exports ? exports.HSGoTo = t() : e.HSGoTo = t()
}(window, function () {
    return (d = {
        "./src/js/hs-go-to.js": function (module, exports, __webpack_require__) {
            "use strict";
            eval("\n\nObject.defineProperty(exports, \"__esModule\", {\n\tvalue: true\n});\n\nvar _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if (\"value\" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();\n\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError(\"Cannot call a class as a function\"); } }\n\nvar HSGoTo = function () {\n\tfunction HSGoTo(elem, settings) {\n\t\t_classCallCheck(this, HSGoTo);\n\n\t\tthis.elem = elem;\n\t\tthis.defaults = {\n\t\t\tpageContainerSelector: 'html, body',\n\t\t\ttargetSelector: null,\n\t\t\tcompensationSelector: null,\n\n\t\t\tanimationInit: 'animated',\n\t\t\tanimationIn: 'fadeInUp',\n\t\t\tanimationOut: 'fadeOutDown',\n\t\t\tduration: 800,\n\n\t\t\toffsetTop: 0,\n\t\t\tposition: {\n\t\t\t\tinit: null,\n\t\t\t\thide: null,\n\t\t\t\tshow: null\n\t\t\t},\n\n\t\t\tisReferencedToOtherPage: null,\n\t\t\tpreventEventClass: 'hs-go-to-prevent-event'\n\t\t};\n\t\tthis.settings = settings;\n\t}\n\n\t_createClass(HSGoTo, [{\n\t\tkey: 'init',\n\t\tvalue: function init() {\n\t\t\tvar context = this,\n\t\t\t    $el = context.elem,\n\t\t\t    dataSettings = $el.attr('data-hs-go-to-options') ? JSON.parse($el.attr('data-hs-go-to-options')) : {},\n\t\t\t    options = $.extend(true, context.defaults, dataSettings, context.settings);\n\n\t\t\toptions.targetOffsetTop = function () {\n\t\t\t\tif ($(options.compensationSelector).length) {\n\t\t\t\t\treturn $(options.targetSelector) ? $(options.targetSelector).offset().top - $(options.compensationSelector).outerHeight() : 0;\n\t\t\t\t} else {\n\t\t\t\t\treturn $(options.targetSelector) ? $(options.targetSelector).offset().top : 0;\n\t\t\t\t}\n\t\t\t};\n\n\t\t\tcontext._prepareObject($el, options);\n\n\t\t\t// Set Position\n\t\t\tif (options.position) {\n\t\t\t\tcontext._setPosition($el, options.position.init);\n\t\t\t}\n\n\t\t\t// Click Events\n\t\t\t$el.on('click', function (e) {\n\t\t\t\tcontext._clickEvents($el, options, e);\n\t\t\t});\n\n\t\t\t// Scroll Events\n\t\t\tif (options.animationIn && options.animationOut) {\n\t\t\t\t$(window).on('scroll', function () {\n\t\t\t\t\tcontext._scrollEvents($el, options);\n\t\t\t\t});\n\t\t\t}\n\t\t}\n\t}, {\n\t\tkey: '_prepareObject',\n\t\tvalue: function _prepareObject(el, params) {\n\t\t\tvar options = params;\n\n\t\t\tif (params.animationIn && params.animationOut) {\n\t\t\t\tif (navigator.userAgent.match('MSIE 10.0;')) {\n\t\t\t\t\t$('html').addClass('ie10');\n\t\t\t\t}\n\n\t\t\t\tel.addClass(options.animationInit + ' ' + options.animationOut + ' ' + options.preventEventClass);\n\t\t\t}\n\t\t}\n\t}, {\n\t\tkey: '_setPosition',\n\t\tvalue: function _setPosition(el, params) {\n\t\t\tvar options = params;\n\n\t\t\tel.css(options);\n\t\t}\n\t}, {\n\t\tkey: '_clickEvents',\n\t\tvalue: function _clickEvents(el, params, event) {\n\t\t\tvar options = params;\n\n\t\t\tif (!options.isReferencedToOtherPage) {\n\t\t\t\tif (event) {\n\t\t\t\t\tevent.preventDefault();\n\t\t\t\t}\n\n\t\t\t\t$(options.pageContainerSelector).stop().animate({\n\t\t\t\t\tscrollTop: options.targetOffsetTop()\n\t\t\t\t}, options.duration);\n\t\t\t}\n\t\t}\n\t}, {\n\t\tkey: '_scrollEvents',\n\t\tvalue: function _scrollEvents(el, params) {\n\t\t\tvar options = params;\n\n\t\t\tel.css('visibility', '');\n\n\t\t\tif ($(window).scrollTop() >= options.offsetTop) {\n\t\t\t\tif (options.position.show) {\n\t\t\t\t\tel.css(options.position.show);\n\t\t\t\t}\n\n\t\t\t\tel.removeClass(options.animationOut).addClass(options.animationIn);\n\t\t\t} else {\n\t\t\t\tif (options.position.hide) {\n\t\t\t\t\tel.css(options.position.hide);\n\t\t\t\t}\n\n\t\t\t\tel.removeClass(options.animationIn).addClass(options.animationOut);\n\t\t\t}\n\t\t}\n\t}]);\n\n\treturn HSGoTo;\n}();\n\nexports.default = HSGoTo;\n\n//# sourceURL=webpack://HSGoTo/./src/js/hs-go-to.js?")
        }
    }, e = {}, f.m = d, f.c = e, f.d = function (e, t, n) {
        f.o(e, t) || Object.defineProperty(e, t, {enumerable: !0, get: n})
    }, f.r = function (e) {
        "undefined" != typeof Symbol && Symbol.toStringTag && Object.defineProperty(e, Symbol.toStringTag, {value: "Module"}), Object.defineProperty(e, "__esModule", {value: !0})
    }, f.t = function (e, t) {
        if (1 & t && (e = f(e)), 8 & t) return e;
        if (4 & t && "object" == typeof e && e && e.__esModule) return e;
        var n = Object.create(null);
        if (f.r(n), Object.defineProperty(n, "default", {
            enumerable: !0,
            value: e
        }), 2 & t && "string" != typeof e) for (var s in e) f.d(n, s, function (t) {
            return e[t]
        }.bind(null, s));
        return n
    }, f.n = function (e) {
        var t = e && e.__esModule ? function () {
            return e.default
        } : function () {
            return e
        };
        return f.d(t, "a", t), t
    }, f.o = function (e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, f.p = "", f(f.s = "./src/js/hs-go-to.js")).default;

    function f(t) {
        if (e[t]) return e[t].exports;
        var n = e[t] = {i: t, l: !1, exports: {}};
        return d[t].call(n.exports, n, n.exports, f), n.l = !0, n.exports
    }

    var d, e
}), function (e) {
    "use strict";
    "function" == typeof define && define.amd ? define(["jquery"], e) : "undefined" != typeof exports ? module.exports = e(require("jquery")) : e(jQuery)
}(function (e) {
    "use strict";
    var t = window.Slick || {};
    (t = function () {
        var t = 0;
        return function (n, s) {
            var i, o = this;
            o.defaults = {
                accessibility: !0,
                adaptiveHeight: !1,
                appendArrows: e(n),
                appendDots: e(n),
                arrows: !0,
                asNavFor: null,
                prevArrow: '<button class="slick-prev" aria-label="Previous" type="button">Previous</button>',
                nextArrow: '<button class="slick-next" aria-label="Next" type="button">Next</button>',
                autoplay: !1,
                autoplaySpeed: 3e3,
                centerMode: !1,
                centerPadding: "50px",
                cssEase: "ease",
                customPaging: function (t, n) {
                    return e('<button type="button" />').text(n + 1)
                },
                dots: !1,
                dotsClass: "slick-dots",
                draggable: !0,
                easing: "linear",
                edgeFriction: .35,
                fade: !1,
                focusOnSelect: !1,
                focusOnChange: !1,
                infinite: !0,
                initialSlide: 0,
                lazyLoad: "ondemand",
                mobileFirst: !1,
                pauseOnHover: !0,
                pauseOnFocus: !0,
                pauseOnDotsHover: !1,
                respondTo: "window",
                responsive: null,
                rows: 1,
                rtl: !1,
                slide: "",
                slidesPerRow: 1,
                slidesToShow: 1,
                slidesToScroll: 1,
                speed: 500,
                swipe: !0,
                swipeToSlide: !1,
                touchMove: !0,
                touchThreshold: 5,
                useCSS: !0,
                useTransform: !0,
                variableWidth: !1,
                vertical: !1,
                verticalSwiping: !1,
                waitForAnimate: !0,
                zIndex: 1e3
            }, o.initials = {
                animating: !1,
                dragging: !1,
                autoPlayTimer: null,
                currentDirection: 0,
                currentLeft: null,
                currentSlide: 0,
                direction: 1,
                $dots: null,
                listWidth: null,
                listHeight: null,
                loadIndex: 0,
                $nextArrow: null,
                $prevArrow: null,
                scrolling: !1,
                slideCount: null,
                slideWidth: null,
                $slideTrack: null,
                $slides: null,
                sliding: !1,
                slideOffset: 0,
                swipeLeft: null,
                swiping: !1,
                $list: null,
                touchObject: {},
                transformsEnabled: !1,
                unslicked: !1
            }, e.extend(o, o.initials), o.activeBreakpoint = null, o.animType = null, o.animProp = null, o.breakpoints = [], o.breakpointSettings = [], o.cssTransitions = !1, o.focussed = !1, o.interrupted = !1, o.hidden = "hidden", o.paused = !0, o.positionProp = null, o.respondTo = null, o.rowCount = 1, o.shouldClick = !0, o.$slider = e(n), o.$slidesCache = null, o.transformType = null, o.transitionType = null, o.visibilityChange = "visibilitychange", o.windowWidth = 0, o.windowTimer = null, i = e(n).data("slick") || {}, o.options = e.extend({}, o.defaults, s, i), o.currentSlide = o.options.initialSlide, o.originalSettings = o.options, void 0 !== document.mozHidden ? (o.hidden = "mozHidden", o.visibilityChange = "mozvisibilitychange") : void 0 !== document.webkitHidden && (o.hidden = "webkitHidden", o.visibilityChange = "webkitvisibilitychange"), o.autoPlay = e.proxy(o.autoPlay, o), o.autoPlayClear = e.proxy(o.autoPlayClear, o), o.autoPlayIterator = e.proxy(o.autoPlayIterator, o), o.changeSlide = e.proxy(o.changeSlide, o), o.clickHandler = e.proxy(o.clickHandler, o), o.selectHandler = e.proxy(o.selectHandler, o), o.setPosition = e.proxy(o.setPosition, o), o.swipeHandler = e.proxy(o.swipeHandler, o), o.dragHandler = e.proxy(o.dragHandler, o), o.keyHandler = e.proxy(o.keyHandler, o), o.instanceUid = t++, o.htmlExpr = /^(?:\s*(<[\w\W]+>)[^>]*)$/, o.registerBreakpoints(), o.init(!0)
        }
    }()).prototype.activateADA = function () {
        this.$slideTrack.find(".slick-active").attr({"aria-hidden": "false"}).find("a, input, button, select").attr({tabindex: "0"})
    }, t.prototype.addSlide = t.prototype.slickAdd = function (t, n, s) {
        var i = this;
        if ("boolean" == typeof n) s = n, n = null; else if (n < 0 || n >= i.slideCount) return !1;
        i.unload(), "number" == typeof n ? 0 === n && 0 === i.$slides.length ? e(t).appendTo(i.$slideTrack) : s ? e(t).insertBefore(i.$slides.eq(n)) : e(t).insertAfter(i.$slides.eq(n)) : !0 === s ? e(t).prependTo(i.$slideTrack) : e(t).appendTo(i.$slideTrack), i.$slides = i.$slideTrack.children(this.options.slide), i.$slideTrack.children(this.options.slide).detach(), i.$slideTrack.append(i.$slides), i.$slides.each(function (t, n) {
            e(n).attr("data-slick-index", t)
        }), i.$slidesCache = i.$slides, i.reinit()
    }, t.prototype.animateHeight = function () {
        var e = this;
        if (1 === e.options.slidesToShow && !0 === e.options.adaptiveHeight) {
            var t = e.$slides.eq(e.currentSlide).outerHeight(!0);
            e.$list.animate({height: t}, e.options.speed)
        }
    }, t.prototype.animateSlide = function (t, n) {
        var s = {}, i = this;
        i.animateHeight(), !0 === i.options.rtl && !1 === i.options.vertical && (t = -t), !1 === i.transformsEnabled ? !1 === i.options.vertical ? i.$slideTrack.animate({left: t}, i.options.speed, i.options.easing, n) : i.$slideTrack.animate({top: t}, i.options.speed, i.options.easing, n) : !1 === i.cssTransitions ? (!0 === i.options.rtl && (i.currentLeft = -i.currentLeft), e({animStart: i.currentLeft}).animate({animStart: t}, {
            duration: i.options.speed,
            easing: i.options.easing,
            step: function (e) {
                e = Math.ceil(e), !1 === i.options.vertical ? (s[i.animType] = "translate(" + e + "px, 0px)", i.$slideTrack.css(s)) : (s[i.animType] = "translate(0px," + e + "px)", i.$slideTrack.css(s))
            },
            complete: function () {
                n && n.call()
            }
        })) : (i.applyTransition(), t = Math.ceil(t), !1 === i.options.vertical ? s[i.animType] = "translate3d(" + t + "px, 0px, 0px)" : s[i.animType] = "translate3d(0px," + t + "px, 0px)", i.$slideTrack.css(s), n && setTimeout(function () {
            i.disableTransition(), n.call()
        }, i.options.speed))
    }, t.prototype.getNavTarget = function () {
        var t = this.options.asNavFor;
        return t && null !== t && (t = e(t).not(this.$slider)), t
    }, t.prototype.asNavFor = function (t) {
        var n = this.getNavTarget();
        null !== n && "object" == typeof n && n.each(function () {
            var n = e(this).slick("getSlick");
            n.unslicked || n.slideHandler(t, !0)
        })
    }, t.prototype.applyTransition = function (e) {
        var t = this, n = {};
        !1 === t.options.fade ? n[t.transitionType] = t.transformType + " " + t.options.speed + "ms " + t.options.cssEase : n[t.transitionType] = "opacity " + t.options.speed + "ms " + t.options.cssEase, !1 === t.options.fade ? t.$slideTrack.css(n) : t.$slides.eq(e).css(n)
    }, t.prototype.autoPlay = function () {
        var e = this;
        e.autoPlayClear(), e.slideCount > e.options.slidesToShow && (e.autoPlayTimer = setInterval(e.autoPlayIterator, e.options.autoplaySpeed))
    }, t.prototype.autoPlayClear = function () {
        this.autoPlayTimer && clearInterval(this.autoPlayTimer)
    }, t.prototype.autoPlayIterator = function () {
        var e = this, t = e.currentSlide + e.options.slidesToScroll;
        e.paused || e.interrupted || e.focussed || (!1 === e.options.infinite && (1 === e.direction && e.currentSlide + 1 === e.slideCount - 1 ? e.direction = 0 : 0 === e.direction && (t = e.currentSlide - e.options.slidesToScroll, e.currentSlide - 1 == 0 && (e.direction = 1))), e.slideHandler(t))
    }, t.prototype.buildArrows = function () {
        var t = this;
        !0 === t.options.arrows && (t.$prevArrow = e(t.options.prevArrow).addClass("slick-arrow"), t.$nextArrow = e(t.options.nextArrow).addClass("slick-arrow"), t.slideCount > t.options.slidesToShow ? (t.$prevArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"), t.$nextArrow.removeClass("slick-hidden").removeAttr("aria-hidden tabindex"), t.htmlExpr.test(t.options.prevArrow) && t.$prevArrow.prependTo(t.options.appendArrows), t.htmlExpr.test(t.options.nextArrow) && t.$nextArrow.appendTo(t.options.appendArrows), !0 !== t.options.infinite && t.$prevArrow.addClass("slick-disabled").attr("aria-disabled", "true")) : t.$prevArrow.add(t.$nextArrow).addClass("slick-hidden").attr({
            "aria-disabled": "true",
            tabindex: "-1"
        }))
    }, t.prototype.buildDots = function () {
        var t, n, s = this;
        if (!0 === s.options.dots) {
            for (s.$slider.addClass("slick-dotted"), n = e("<ul />").addClass(s.options.dotsClass), t = 0; t <= s.getDotCount(); t += 1) n.append(e("<li />").append(s.options.customPaging.call(this, s, t)));
            s.$dots = n.appendTo(s.options.appendDots), s.$dots.find("li").first().addClass("slick-active")
        }
    }, t.prototype.buildOut = function () {
        var t = this;
        t.$slides = t.$slider.children(t.options.slide + ":not(.slick-cloned)").addClass("slick-slide"), t.slideCount = t.$slides.length, t.$slides.each(function (t, n) {
            e(n).attr("data-slick-index", t).data("originalStyling", e(n).attr("style") || "")
        }), t.$slider.addClass("slick-slider"), t.$slideTrack = 0 === t.slideCount ? e('<div class="slick-track"/>').appendTo(t.$slider) : t.$slides.wrapAll('<div class="slick-track"/>').parent(), t.$list = t.$slideTrack.wrap('<div class="slick-list"/>').parent(), t.$slideTrack.css("opacity", 0), !0 !== t.options.centerMode && !0 !== t.options.swipeToSlide || (t.options.slidesToScroll = 1), e("img[data-lazy]", t.$slider).not("[src]").addClass("slick-loading"), t.setupInfinite(), t.buildArrows(), t.buildDots(), t.updateDots(), t.setSlideClasses("number" == typeof t.currentSlide ? t.currentSlide : 0), !0 === t.options.draggable && t.$list.addClass("draggable")
    }, t.prototype.buildRows = function () {
        var e, t, n, s, i, o, r, a = this;
        if (s = document.createDocumentFragment(), o = a.$slider.children(), a.options.rows > 1) {
            for (r = a.options.slidesPerRow * a.options.rows, i = Math.ceil(o.length / r), e = 0; e < i; e++) {
                var l = document.createElement("div");
                for (t = 0; t < a.options.rows; t++) {
                    var c = document.createElement("div");
                    for (n = 0; n < a.options.slidesPerRow; n++) {
                        var d = e * r + (t * a.options.slidesPerRow + n);
                        o.get(d) && c.appendChild(o.get(d))
                    }
                    l.appendChild(c)
                }
                s.appendChild(l)
            }
            a.$slider.empty().append(s), a.$slider.children().children().children().css({
                width: 100 / a.options.slidesPerRow + "%",
                display: "inline-block"
            })
        }
    }, t.prototype.checkResponsive = function (t, n) {
        var s, i, o, r = this, a = !1, l = r.$slider.width(), c = window.innerWidth || e(window).width();
        if ("window" === r.respondTo ? o = c : "slider" === r.respondTo ? o = l : "min" === r.respondTo && (o = Math.min(c, l)), r.options.responsive && r.options.responsive.length && null !== r.options.responsive) {
            for (s in i = null, r.breakpoints) r.breakpoints.hasOwnProperty(s) && (!1 === r.originalSettings.mobileFirst ? o < r.breakpoints[s] && (i = r.breakpoints[s]) : o > r.breakpoints[s] && (i = r.breakpoints[s]));
            null !== i ? null !== r.activeBreakpoint ? (i !== r.activeBreakpoint || n) && (r.activeBreakpoint = i, "unslick" === r.breakpointSettings[i] ? r.unslick(i) : (r.options = e.extend({}, r.originalSettings, r.breakpointSettings[i]), !0 === t && (r.currentSlide = r.options.initialSlide), r.refresh(t)), a = i) : (r.activeBreakpoint = i, "unslick" === r.breakpointSettings[i] ? r.unslick(i) : (r.options = e.extend({}, r.originalSettings, r.breakpointSettings[i]), !0 === t && (r.currentSlide = r.options.initialSlide), r.refresh(t)), a = i) : null !== r.activeBreakpoint && (r.activeBreakpoint = null, r.options = r.originalSettings, !0 === t && (r.currentSlide = r.options.initialSlide), r.refresh(t), a = i), t || !1 === a || r.$slider.trigger("breakpoint", [r, a])
        }
    }, t.prototype.changeSlide = function (t, n) {
        var s, i, o = this, r = e(t.currentTarget);
        switch (r.is("a") && t.preventDefault(), r.is("li") || (r = r.closest("li")), s = o.slideCount % o.options.slidesToScroll != 0 ? 0 : (o.slideCount - o.currentSlide) % o.options.slidesToScroll, t.data.message) {
            case"previous":
                i = 0 === s ? o.options.slidesToScroll : o.options.slidesToShow - s, o.slideCount > o.options.slidesToShow && o.slideHandler(o.currentSlide - i, !1, n);
                break;
            case"next":
                i = 0 === s ? o.options.slidesToScroll : s, o.slideCount > o.options.slidesToShow && o.slideHandler(o.currentSlide + i, !1, n);
                break;
            case"index":
                var a = 0 === t.data.index ? 0 : t.data.index || r.index() * o.options.slidesToScroll;
                o.slideHandler(o.checkNavigable(a), !1, n), r.children().trigger("focus");
                break;
            default:
                return
        }
    }, t.prototype.checkNavigable = function (e) {
        var t, n;
        if (n = 0, e > (t = this.getNavigableIndexes())[t.length - 1]) e = t[t.length - 1]; else for (var s in t) {
            if (e < t[s]) {
                e = n;
                break
            }
            n = t[s]
        }
        return e
    }, t.prototype.cleanUpEvents = function () {
        var t = this;
        t.options.dots && null !== t.$dots && (e("li", t.$dots).off("click.slick", t.changeSlide).off("mouseenter.slick", e.proxy(t.interrupt, t, !0)).off("mouseleave.slick", e.proxy(t.interrupt, t, !1)), !0 === t.options.accessibility && t.$dots.off("keydown.slick", t.keyHandler)), t.$slider.off("focus.slick blur.slick"), !0 === t.options.arrows && t.slideCount > t.options.slidesToShow && (t.$prevArrow && t.$prevArrow.off("click.slick", t.changeSlide), t.$nextArrow && t.$nextArrow.off("click.slick", t.changeSlide), !0 === t.options.accessibility && (t.$prevArrow && t.$prevArrow.off("keydown.slick", t.keyHandler), t.$nextArrow && t.$nextArrow.off("keydown.slick", t.keyHandler))), t.$list.off("touchstart.slick mousedown.slick", t.swipeHandler), t.$list.off("touchmove.slick mousemove.slick", t.swipeHandler), t.$list.off("touchend.slick mouseup.slick", t.swipeHandler), t.$list.off("touchcancel.slick mouseleave.slick", t.swipeHandler), t.$list.off("click.slick", t.clickHandler), e(document).off(t.visibilityChange, t.visibility), t.cleanUpSlideEvents(), !0 === t.options.accessibility && t.$list.off("keydown.slick", t.keyHandler), !0 === t.options.focusOnSelect && e(t.$slideTrack).children().off("click.slick", t.selectHandler), e(window).off("orientationchange.slick.slick-" + t.instanceUid, t.orientationChange), e(window).off("resize.slick.slick-" + t.instanceUid, t.resize), e("[draggable!=true]", t.$slideTrack).off("dragstart", t.preventDefault), e(window).off("load.slick.slick-" + t.instanceUid, t.setPosition)
    }, t.prototype.cleanUpSlideEvents = function () {
        var t = this;
        t.$list.off("mouseenter.slick", e.proxy(t.interrupt, t, !0)), t.$list.off("mouseleave.slick", e.proxy(t.interrupt, t, !1))
    }, t.prototype.cleanUpRows = function () {
        var e, t = this;
        t.options.rows > 1 && ((e = t.$slides.children().children()).removeAttr("style"), t.$slider.empty().append(e))
    }, t.prototype.clickHandler = function (e) {
        !1 === this.shouldClick && (e.stopImmediatePropagation(), e.stopPropagation(), e.preventDefault())
    }, t.prototype.destroy = function (t) {
        var n = this;
        n.autoPlayClear(), n.touchObject = {}, n.cleanUpEvents(), e(".slick-cloned", n.$slider).detach(), n.$dots && n.$dots.remove(), n.$prevArrow && n.$prevArrow.length && (n.$prevArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display", ""), n.htmlExpr.test(n.options.prevArrow) && n.$prevArrow.remove()), n.$nextArrow && n.$nextArrow.length && (n.$nextArrow.removeClass("slick-disabled slick-arrow slick-hidden").removeAttr("aria-hidden aria-disabled tabindex").css("display", ""), n.htmlExpr.test(n.options.nextArrow) && n.$nextArrow.remove()), n.$slides && (n.$slides.removeClass("slick-slide slick-active slick-center slick-visible slick-current").removeAttr("aria-hidden").removeAttr("data-slick-index").each(function () {
            e(this).attr("style", e(this).data("originalStyling"))
        }), n.$slideTrack.children(this.options.slide).detach(), n.$slideTrack.detach(), n.$list.detach(), n.$slider.append(n.$slides)), n.cleanUpRows(), n.$slider.removeClass("slick-slider"), n.$slider.removeClass("slick-initialized"), n.$slider.removeClass("slick-dotted"), n.unslicked = !0, t || n.$slider.trigger("destroy", [n])
    }, t.prototype.disableTransition = function (e) {
        var t = this, n = {};
        n[t.transitionType] = "", !1 === t.options.fade ? t.$slideTrack.css(n) : t.$slides.eq(e).css(n)
    }, t.prototype.fadeSlide = function (e, t) {
        var n = this;
        !1 === n.cssTransitions ? (n.$slides.eq(e).css({zIndex: n.options.zIndex}), n.$slides.eq(e).animate({opacity: 1}, n.options.speed, n.options.easing, t)) : (n.applyTransition(e), n.$slides.eq(e).css({
            opacity: 1,
            zIndex: n.options.zIndex
        }), t && setTimeout(function () {
            n.disableTransition(e), t.call()
        }, n.options.speed))
    }, t.prototype.fadeSlideOut = function (e) {
        var t = this;
        !1 === t.cssTransitions ? t.$slides.eq(e).animate({
            opacity: 0,
            zIndex: t.options.zIndex - 2
        }, t.options.speed, t.options.easing) : (t.applyTransition(e), t.$slides.eq(e).css({
            opacity: 0,
            zIndex: t.options.zIndex - 2
        }))
    }, t.prototype.filterSlides = t.prototype.slickFilter = function (e) {
        var t = this;
        null !== e && (t.$slidesCache = t.$slides, t.unload(), t.$slideTrack.children(this.options.slide).detach(), t.$slidesCache.filter(e).appendTo(t.$slideTrack), t.reinit())
    }, t.prototype.focusHandler = function () {
        var t = this;
        t.$slider.off("focus.slick blur.slick").on("focus.slick blur.slick", "*", function (n) {
            n.stopImmediatePropagation();
            var s = e(this);
            setTimeout(function () {
                t.options.pauseOnFocus && (t.focussed = s.is(":focus"), t.autoPlay())
            }, 0)
        })
    }, t.prototype.getCurrent = t.prototype.slickCurrentSlide = function () {
        return this.currentSlide
    }, t.prototype.getDotCount = function () {
        var e = this, t = 0, n = 0, s = 0;
        if (!0 === e.options.infinite) if (e.slideCount <= e.options.slidesToShow) ++s; else for (; t < e.slideCount;) ++s, t = n + e.options.slidesToScroll, n += e.options.slidesToScroll <= e.options.slidesToShow ? e.options.slidesToScroll : e.options.slidesToShow; else if (!0 === e.options.centerMode) s = e.slideCount; else if (e.options.asNavFor) for (; t < e.slideCount;) ++s, t = n + e.options.slidesToScroll, n += e.options.slidesToScroll <= e.options.slidesToShow ? e.options.slidesToScroll : e.options.slidesToShow; else s = 1 + Math.ceil((e.slideCount - e.options.slidesToShow) / e.options.slidesToScroll);
        return s - 1
    }, t.prototype.getLeft = function (e) {
        for (var t, n, s, i, o = this, r = 0, a = [], l = [], c = 0; c < o.$slides.length; c++) a[c] = o.$slides[c].clientHeight;
        (o.slideOffset = 0, n = o.$slides.first().outerHeight(!0), !0 === o.options.infinite ? (o.slideCount > o.options.slidesToShow && (o.slideOffset = o.slideWidth * o.options.slidesToShow * -1, i = -1, !0 === o.options.vertical && !0 === o.options.centerMode && (2 === o.options.slidesToShow ? i = -1.5 : 1 === o.options.slidesToShow && (i = -2)), !0 === o.options.vertical && !0 === o.options.infinite && (n = o.$slides.last().outerHeight(!0)), r = n * o.options.slidesToShow * i), o.slideCount % o.options.slidesToScroll != 0 && e + o.options.slidesToScroll > o.slideCount && o.slideCount > o.options.slidesToShow && (e > o.slideCount ? (o.slideOffset = (o.options.slidesToShow - (e - o.slideCount)) * o.slideWidth * -1, r = (o.options.slidesToShow - (e - o.slideCount)) * n * -1) : (o.slideOffset = o.slideCount % o.options.slidesToScroll * o.slideWidth * -1, r = o.slideCount % o.options.slidesToScroll * n * -1))) : e + o.options.slidesToShow > o.slideCount && (o.slideOffset = (e + o.options.slidesToShow - o.slideCount) * o.slideWidth, r = (e + o.options.slidesToShow - o.slideCount) * n), o.slideCount <= o.options.slidesToShow && (o.slideOffset = 0, r = 0), !0 === o.options.centerMode && o.slideCount <= o.options.slidesToShow ? o.slideOffset = o.slideWidth * Math.floor(o.options.slidesToShow) / 2 - o.slideWidth * o.slideCount / 2 : !0 === o.options.centerMode && !0 === o.options.infinite ? o.slideOffset += o.slideWidth * Math.floor(o.options.slidesToShow / 2) - o.slideWidth : !0 === o.options.centerMode && (o.slideOffset = 0, o.slideOffset += o.slideWidth * Math.floor(o.options.slidesToShow / 2)), !1 === o.options.vertical) ? t = e * o.slideWidth * -1 + o.slideOffset : t = -1 * (0 !== (l = a.slice(0, e)).length ? l.reduce(function (e, t) {
            return e + t
        }) : 0) + r;
        return !0 === o.options.variableWidth && (s = o.slideCount <= o.options.slidesToShow || !1 === o.options.infinite ? o.$slideTrack.children(".slick-slide").eq(e) : o.$slideTrack.children(".slick-slide").eq(e + o.options.slidesToShow), t = !0 === o.options.rtl ? s[0] ? -1 * (o.$slideTrack.width() - s[0].offsetLeft - s.width()) : 0 : s[0] ? -1 * s[0].offsetLeft : 0, !0 === o.options.centerMode && (s = o.slideCount <= o.options.slidesToShow || !1 === o.options.infinite ? o.$slideTrack.children(".slick-slide").eq(e) : o.$slideTrack.children(".slick-slide").eq(e + o.options.slidesToShow + 1), t = !0 === o.options.rtl ? s[0] ? -1 * (o.$slideTrack.width() - s[0].offsetLeft - s.width()) : 0 : s[0] ? -1 * s[0].offsetLeft : 0, t += (o.$list.width() - s.outerWidth()) / 2)), t
    }, t.prototype.getOption = t.prototype.slickGetOption = function (e) {
        return this.options[e]
    }, t.prototype.getNavigableIndexes = function () {
        var e, t = this, n = 0, s = 0, i = [];
        for (!1 === t.options.infinite ? e = t.slideCount : (n = -1 * t.options.slidesToScroll, s = -1 * t.options.slidesToScroll, e = 2 * t.slideCount); n < e;) i.push(n), n = s + t.options.slidesToScroll, s += t.options.slidesToScroll <= t.options.slidesToShow ? t.options.slidesToScroll : t.options.slidesToShow;
        return i
    }, t.prototype.getSlick = function () {
        return this
    }, t.prototype.getSlideCount = function () {
        var t, n, s = this;
        return n = !0 === s.options.centerMode ? s.slideWidth * Math.floor(s.options.slidesToShow / 2) : 0, !0 === s.options.swipeToSlide ? (s.$slideTrack.find(".slick-slide").each(function (i, o) {
            if (o.offsetLeft - n + e(o).outerWidth() / 2 > -1 * s.swipeLeft) return t = o, !1
        }), Math.abs(e(t).attr("data-slick-index") - s.currentSlide) || 1) : s.options.slidesToScroll
    }, t.prototype.goTo = t.prototype.slickGoTo = function (e, t) {
        this.changeSlide({data: {message: "index", index: parseInt(e)}}, t)
    }, t.prototype.init = function (t) {
        var n = this;
        e(n.$slider).hasClass("slick-initialized") || (e(n.$slider).addClass("slick-initialized"), n.buildRows(), n.buildOut(), n.setProps(), n.startLoad(), n.loadSlider(), n.initializeEvents(), n.updateArrows(), n.updateDots(), n.checkResponsive(!0), n.focusHandler()), t && n.$slider.trigger("init", [n]), !0 === n.options.accessibility && n.initADA(), n.options.autoplay && (n.paused = !1, n.autoPlay())
    }, t.prototype.initADA = function () {
        var t = this, n = Math.ceil(t.slideCount / t.options.slidesToShow),
            s = t.getNavigableIndexes().filter(function (e) {
                return e >= 0 && e < t.slideCount
            });
        t.$slides.add(t.$slideTrack.find(".slick-cloned")).attr({
            "aria-hidden": "true",
            tabindex: "-1"
        }).find("a, input, button, select").attr({tabindex: "-1"}), null !== t.$dots && (t.$slides.not(t.$slideTrack.find(".slick-cloned")).each(function (n) {
            var i = s.indexOf(n);
            e(this).attr({
                role: "tabpanel",
                id: "slick-slide" + t.instanceUid + n,
                tabindex: -1
            }), -1 !== i && e(this).attr({"aria-describedby": "slick-slide-control" + t.instanceUid + i})
        }), t.$dots.attr("role", "tablist").find("li").each(function (i) {
            var o = s[i];
            e(this).attr({role: "presentation"}), e(this).find("button").first().attr({
                role: "tab",
                id: "slick-slide-control" + t.instanceUid + i,
                "aria-controls": "slick-slide" + t.instanceUid + o,
                "aria-label": i + 1 + " of " + n,
                "aria-selected": null,
                tabindex: "-1"
            })
        }).eq(t.currentSlide).find("button").attr({"aria-selected": "true", tabindex: "0"}).end());
        for (var i = t.currentSlide, o = i + t.options.slidesToShow; i < o; i++) t.$slides.eq(i).attr("tabindex", 0);
        t.activateADA()
    }, t.prototype.initArrowEvents = function () {
        var e = this;
        !0 === e.options.arrows && e.slideCount > e.options.slidesToShow && (e.$prevArrow.off("click.slick").on("click.slick", {message: "previous"}, e.changeSlide), e.$nextArrow.off("click.slick").on("click.slick", {message: "next"}, e.changeSlide), !0 === e.options.accessibility && (e.$prevArrow.on("keydown.slick", e.keyHandler), e.$nextArrow.on("keydown.slick", e.keyHandler)))
    }, t.prototype.initDotEvents = function () {
        var t = this;
        !0 === t.options.dots && (e("li", t.$dots).on("click.slick", {message: "index"}, t.changeSlide), !0 === t.options.accessibility && t.$dots.on("keydown.slick", t.keyHandler)), !0 === t.options.dots && !0 === t.options.pauseOnDotsHover && e("li", t.$dots).on("mouseenter.slick", e.proxy(t.interrupt, t, !0)).on("mouseleave.slick", e.proxy(t.interrupt, t, !1))
    }, t.prototype.initSlideEvents = function () {
        var t = this;
        t.options.pauseOnHover && (t.$list.on("mouseenter.slick", e.proxy(t.interrupt, t, !0)), t.$list.on("mouseleave.slick", e.proxy(t.interrupt, t, !1)))
    }, t.prototype.initializeEvents = function () {
        var t = this;
        t.initArrowEvents(), t.initDotEvents(), t.initSlideEvents(), t.$list.on("touchstart.slick mousedown.slick", {action: "start"}, t.swipeHandler), t.$list.on("touchmove.slick mousemove.slick", {action: "move"}, t.swipeHandler), t.$list.on("touchend.slick mouseup.slick", {action: "end"}, t.swipeHandler), t.$list.on("touchcancel.slick mouseleave.slick", {action: "end"}, t.swipeHandler), t.$list.on("click.slick", t.clickHandler), e(document).on(t.visibilityChange, e.proxy(t.visibility, t)), !0 === t.options.accessibility && t.$list.on("keydown.slick", t.keyHandler), !0 === t.options.focusOnSelect && e(t.$slideTrack).children().on("click.slick", t.selectHandler), e(window).on("orientationchange.slick.slick-" + t.instanceUid, e.proxy(t.orientationChange, t)), e(window).on("resize.slick.slick-" + t.instanceUid, e.proxy(t.resize, t)), e("[draggable!=true]", t.$slideTrack).on("dragstart", t.preventDefault), e(window).on("load.slick.slick-" + t.instanceUid, t.setPosition), e(t.setPosition)
    }, t.prototype.initUI = function () {
        var e = this;
        !0 === e.options.arrows && e.slideCount > e.options.slidesToShow && (e.$prevArrow.show(), e.$nextArrow.show()), !0 === e.options.dots && e.slideCount > e.options.slidesToShow && e.$dots.show()
    }, t.prototype.keyHandler = function (e) {
        var t = this;
        e.target.tagName.match("TEXTAREA|INPUT|SELECT") || (37 === e.keyCode && !0 === t.options.accessibility ? t.changeSlide({data: {message: !0 === t.options.rtl ? "next" : "previous"}}) : 39 === e.keyCode && !0 === t.options.accessibility && t.changeSlide({data: {message: !0 === t.options.rtl ? "previous" : "next"}}))
    }, t.prototype.lazyLoad = function () {
        var t, n, s, i = this;

        function o(t) {
            e("img[data-lazy]", t).each(function () {
                var t = e(this), n = e(this).attr("data-lazy"), s = e(this).attr("data-srcset"),
                    o = e(this).attr("data-sizes") || i.$slider.attr("data-sizes"), r = document.createElement("img");
                r.onload = function () {
                    t.animate({opacity: 0}, 100, function () {
                        s && (t.attr("srcset", s), o && t.attr("sizes", o)), t.attr("src", n).animate({opacity: 1}, 200, function () {
                            t.removeAttr("data-lazy data-srcset data-sizes").removeClass("slick-loading")
                        }), i.$slider.trigger("lazyLoaded", [i, t, n])
                    })
                }, r.onerror = function () {
                    t.removeAttr("data-lazy").removeClass("slick-loading").addClass("slick-lazyload-error"), i.$slider.trigger("lazyLoadError", [i, t, n])
                }, r.src = n
            })
        }

        if (!0 === i.options.centerMode ? !0 === i.options.infinite ? s = (n = i.currentSlide + (i.options.slidesToShow / 2 + 1)) + i.options.slidesToShow + 2 : (n = Math.max(0, i.currentSlide - (i.options.slidesToShow / 2 + 1)), s = i.options.slidesToShow / 2 + 1 + 2 + i.currentSlide) : (n = i.options.infinite ? i.options.slidesToShow + i.currentSlide : i.currentSlide, s = Math.ceil(n + i.options.slidesToShow), !0 === i.options.fade && (n > 0 && n--, s <= i.slideCount && s++)), t = i.$slider.find(".slick-slide").slice(n, s), "anticipated" === i.options.lazyLoad) for (var r = n - 1, a = s, l = i.$slider.find(".slick-slide"), c = 0; c < i.options.slidesToScroll; c++) r < 0 && (r = i.slideCount - 1), t = (t = t.add(l.eq(r))).add(l.eq(a)), r--, a++;
        o(t), i.slideCount <= i.options.slidesToShow ? o(i.$slider.find(".slick-slide")) : i.currentSlide >= i.slideCount - i.options.slidesToShow ? o(i.$slider.find(".slick-cloned").slice(0, i.options.slidesToShow)) : 0 === i.currentSlide && o(i.$slider.find(".slick-cloned").slice(-1 * i.options.slidesToShow))
    }, t.prototype.loadSlider = function () {
        var e = this;
        e.setPosition(), e.$slideTrack.css({opacity: 1}), e.$slider.removeClass("slick-loading"), e.initUI(), "progressive" === e.options.lazyLoad && e.progressiveLazyLoad()
    }, t.prototype.next = t.prototype.slickNext = function () {
        this.changeSlide({data: {message: "next"}})
    }, t.prototype.orientationChange = function () {
        this.checkResponsive(), this.setPosition()
    }, t.prototype.pause = t.prototype.slickPause = function () {
        this.autoPlayClear(), this.paused = !0
    }, t.prototype.play = t.prototype.slickPlay = function () {
        var e = this;
        e.autoPlay(), e.options.autoplay = !0, e.paused = !1, e.focussed = !1, e.interrupted = !1
    }, t.prototype.postSlide = function (t) {
        var n = this;
        n.unslicked || (n.$slider.trigger("afterChange", [n, t]), n.animating = !1, n.slideCount > n.options.slidesToShow && n.setPosition(), n.swipeLeft = null, n.options.autoplay && n.autoPlay(), !0 === n.options.accessibility && (n.initADA(), n.options.focusOnChange && e(n.$slides.get(n.currentSlide)).attr("tabindex", 0).focus()))
    }, t.prototype.prev = t.prototype.slickPrev = function () {
        this.changeSlide({data: {message: "previous"}})
    }, t.prototype.preventDefault = function (e) {
        e.preventDefault()
    }, t.prototype.progressiveLazyLoad = function (t) {
        t = t || 1;
        var n, s, i, o, r, a = this, l = e("img[data-lazy]", a.$slider);
        l.length ? (n = l.first(), s = n.attr("data-lazy"), i = n.attr("data-srcset"), o = n.attr("data-sizes") || a.$slider.attr("data-sizes"), (r = document.createElement("img")).onload = function () {
            i && (n.attr("srcset", i), o && n.attr("sizes", o)), n.attr("src", s).removeAttr("data-lazy data-srcset data-sizes").removeClass("slick-loading"), !0 === a.options.adaptiveHeight && a.setPosition(), a.$slider.trigger("lazyLoaded", [a, n, s]), a.progressiveLazyLoad()
        }, r.onerror = function () {
            t < 3 ? setTimeout(function () {
                a.progressiveLazyLoad(t + 1)
            }, 500) : (n.removeAttr("data-lazy").removeClass("slick-loading").addClass("slick-lazyload-error"), a.$slider.trigger("lazyLoadError", [a, n, s]), a.progressiveLazyLoad())
        }, r.src = s) : a.$slider.trigger("allImagesLoaded", [a])
    }, t.prototype.refresh = function (t) {
        var n, s, i = this;
        s = i.slideCount - i.options.slidesToShow, !i.options.infinite && i.currentSlide > s && (i.currentSlide = s), i.slideCount <= i.options.slidesToShow && (i.currentSlide = 0), n = i.currentSlide, i.destroy(!0), e.extend(i, i.initials, {currentSlide: n}), i.init(), t || i.changeSlide({
            data: {
                message: "index",
                index: n
            }
        }, !1)
    }, t.prototype.registerBreakpoints = function () {
        var t, n, s, i = this, o = i.options.responsive || null;
        if ("array" === e.type(o) && o.length) {
            for (t in i.respondTo = i.options.respondTo || "window", o) if (s = i.breakpoints.length - 1, o.hasOwnProperty(t)) {
                for (n = o[t].breakpoint; s >= 0;) i.breakpoints[s] && i.breakpoints[s] === n && i.breakpoints.splice(s, 1), s--;
                i.breakpoints.push(n), i.breakpointSettings[n] = o[t].settings
            }
            i.breakpoints.sort(function (e, t) {
                return i.options.mobileFirst ? e - t : t - e
            })
        }
    }, t.prototype.reinit = function () {
        var t = this;
        t.$slides = t.$slideTrack.children(t.options.slide).addClass("slick-slide"), t.slideCount = t.$slides.length, t.currentSlide >= t.slideCount && 0 !== t.currentSlide && (t.currentSlide = t.currentSlide - t.options.slidesToScroll), t.slideCount <= t.options.slidesToShow && (t.currentSlide = 0), t.registerBreakpoints(), t.setProps(), t.setupInfinite(), t.buildArrows(), t.updateArrows(), t.initArrowEvents(), t.buildDots(), t.updateDots(), t.initDotEvents(), t.cleanUpSlideEvents(), t.initSlideEvents(), t.checkResponsive(!1, !0), !0 === t.options.focusOnSelect && e(t.$slideTrack).children().on("click.slick", t.selectHandler), t.setSlideClasses("number" == typeof t.currentSlide ? t.currentSlide : 0), t.setPosition(), t.focusHandler(), t.paused = !t.options.autoplay, t.autoPlay(), t.$slider.trigger("reInit", [t])
    }, t.prototype.resize = function () {
        var t = this;
        e(window).width() !== t.windowWidth && (clearTimeout(t.windowDelay), t.windowDelay = window.setTimeout(function () {
            t.windowWidth = e(window).width(), t.checkResponsive(), t.unslicked || t.setPosition()
        }, 50))
    }, t.prototype.removeSlide = t.prototype.slickRemove = function (e, t, n) {
        var s = this;
        if (e = "boolean" == typeof e ? !0 === (t = e) ? 0 : s.slideCount - 1 : !0 === t ? --e : e, s.slideCount < 1 || e < 0 || e > s.slideCount - 1) return !1;
        s.unload(), !0 === n ? s.$slideTrack.children().remove() : s.$slideTrack.children(this.options.slide).eq(e).remove(), s.$slides = s.$slideTrack.children(this.options.slide), s.$slideTrack.children(this.options.slide).detach(), s.$slideTrack.append(s.$slides), s.$slidesCache = s.$slides, s.reinit()
    }, t.prototype.setCSS = function (e) {
        var t, n, s = this, i = {};
        !0 === s.options.rtl && (e = -e), t = "left" == s.positionProp ? Math.ceil(e) + "px" : "0px", n = "top" == s.positionProp ? Math.ceil(e) + "px" : "0px", i[s.positionProp] = e, !1 === s.transformsEnabled ? s.$slideTrack.css(i) : (i = {}, !1 === s.cssTransitions ? (i[s.animType] = "translate(" + t + ", " + n + ")", s.$slideTrack.css(i)) : (i[s.animType] = "translate3d(" + t + ", " + n + ", 0px)", s.$slideTrack.css(i)))
    }, t.prototype.setDimensions = function () {
        var e = this;
        !1 === e.options.vertical ? !0 === e.options.centerMode && e.$list.css({padding: "0px " + e.options.centerPadding}) : (e.$list.height(e.$slides.first().outerHeight(!0) * e.options.slidesToShow), !0 === e.options.centerMode && e.$list.css({padding: e.options.centerPadding + " 0px"})), e.listWidth = e.$list.width(), e.listHeight = e.$list.height(), !1 === e.options.vertical && !1 === e.options.variableWidth ? (e.slideWidth = Math.ceil(e.listWidth / e.options.slidesToShow), e.$slideTrack.width(Math.ceil(e.slideWidth * e.$slideTrack.children(".slick-slide").length))) : !0 === e.options.variableWidth ? e.$slideTrack.width(5e3 * e.slideCount) : (e.slideWidth = Math.ceil(e.listWidth), e.$slideTrack.height(Math.ceil(e.$slides.first().outerHeight(!0) * e.$slideTrack.children(".slick-slide").length)));
        var t = e.$slides.first().outerWidth(!0) - e.$slides.first().width();
        !1 === e.options.variableWidth && e.$slideTrack.children(".slick-slide").width(e.slideWidth - t)
    }, t.prototype.setFade = function () {
        var t, n = this;
        n.$slides.each(function (s, i) {
            t = n.slideWidth * s * -1, !0 === n.options.rtl ? e(i).css({
                position: "relative",
                right: t,
                top: 0,
                zIndex: n.options.zIndex - 2,
                opacity: 0
            }) : e(i).css({position: "relative", left: t, top: 0, zIndex: n.options.zIndex - 2, opacity: 0})
        }), n.$slides.eq(n.currentSlide).css({zIndex: n.options.zIndex - 1, opacity: 1})
    }, t.prototype.setHeight = function () {
        var e = this;
        if (1 === e.options.slidesToShow && !0 === e.options.adaptiveHeight) {
            var t = e.$slides.eq(e.currentSlide).outerHeight(!0);
            e.$list.css("height", t)
        }
    }, t.prototype.setOption = t.prototype.slickSetOption = function () {
        var t, n, s, i, o, r = this, a = !1;
        if ("object" === e.type(arguments[0]) ? (s = arguments[0], a = arguments[1], o = "multiple") : "string" === e.type(arguments[0]) && (s = arguments[0], i = arguments[1], a = arguments[2], "responsive" === arguments[0] && "array" === e.type(arguments[1]) ? o = "responsive" : void 0 !== arguments[1] && (o = "single")), "single" === o) r.options[s] = i; else if ("multiple" === o) e.each(s, function (e, t) {
            r.options[e] = t
        }); else if ("responsive" === o) for (n in i) if ("array" !== e.type(r.options.responsive)) r.options.responsive = [i[n]]; else {
            for (t = r.options.responsive.length - 1; t >= 0;) r.options.responsive[t].breakpoint === i[n].breakpoint && r.options.responsive.splice(t, 1), t--;
            r.options.responsive.push(i[n])
        }
        a && (r.unload(), r.reinit())
    }, t.prototype.setPosition = function () {
        var e = this;
        e.setDimensions(), e.setHeight(), !1 === e.options.fade ? e.setCSS(e.getLeft(e.currentSlide)) : e.setFade(), e.$slider.trigger("setPosition", [e])
    }, t.prototype.setProps = function () {
        var e = this, t = document.body.style;
        e.positionProp = !0 === e.options.vertical ? "top" : "left", "top" === e.positionProp ? e.$slider.addClass("slick-vertical") : e.$slider.removeClass("slick-vertical"), void 0 === t.WebkitTransition && void 0 === t.MozTransition && void 0 === t.msTransition || !0 === e.options.useCSS && (e.cssTransitions = !0), e.options.fade && ("number" == typeof e.options.zIndex ? e.options.zIndex < 3 && (e.options.zIndex = 3) : e.options.zIndex = e.defaults.zIndex), void 0 !== t.OTransform && (e.animType = "OTransform", e.transformType = "-o-transform", e.transitionType = "OTransition", void 0 === t.perspectiveProperty && void 0 === t.webkitPerspective && (e.animType = !1)), void 0 !== t.MozTransform && (e.animType = "MozTransform", e.transformType = "-moz-transform", e.transitionType = "MozTransition", void 0 === t.perspectiveProperty && void 0 === t.MozPerspective && (e.animType = !1)), void 0 !== t.webkitTransform && (e.animType = "webkitTransform", e.transformType = "-webkit-transform", e.transitionType = "webkitTransition", void 0 === t.perspectiveProperty && void 0 === t.webkitPerspective && (e.animType = !1)), void 0 !== t.msTransform && (e.animType = "msTransform", e.transformType = "-ms-transform", e.transitionType = "msTransition", void 0 === t.msTransform && (e.animType = !1)), void 0 !== t.transform && !1 !== e.animType && (e.animType = "transform", e.transformType = "transform", e.transitionType = "transition"), e.transformsEnabled = e.options.useTransform && null !== e.animType && !1 !== e.animType
    }, t.prototype.setSlideClasses = function (e) {
        var t, n, s, i, o = this;
        if (n = o.$slider.find(".slick-slide").removeClass("slick-active slick-center slick-current").attr("aria-hidden", "true"), o.$slides.eq(e).addClass("slick-current"), !0 === o.options.centerMode) {
            var r = o.options.slidesToShow % 2 == 0 ? 1 : 0;
            t = Math.floor(o.options.slidesToShow / 2), !0 === o.options.infinite && (e >= t && e <= o.slideCount - 1 - t ? o.$slides.slice(e - t + r, e + t + 1).addClass("slick-active").attr("aria-hidden", "false") : (s = o.options.slidesToShow + e, n.slice(s - t + 1 + r, s + t + 2).addClass("slick-active").attr("aria-hidden", "false")), 0 === e ? n.eq(n.length - 1 - o.options.slidesToShow).addClass("slick-center") : e === o.slideCount - 1 && n.eq(o.options.slidesToShow).addClass("slick-center")), o.$slides.eq(e).addClass("slick-center")
        } else e >= 0 && e <= o.slideCount - o.options.slidesToShow ? o.$slides.slice(e, e + o.options.slidesToShow).addClass("slick-active").attr("aria-hidden", "false") : n.length <= o.options.slidesToShow ? n.addClass("slick-active").attr("aria-hidden", "false") : (i = o.slideCount % o.options.slidesToShow, s = !0 === o.options.infinite ? o.options.slidesToShow + e : e, o.options.slidesToShow == o.options.slidesToScroll && o.slideCount - e < o.options.slidesToShow ? n.slice(s - (o.options.slidesToShow - i), s + i).addClass("slick-active").attr("aria-hidden", "false") : n.slice(s, s + o.options.slidesToShow).addClass("slick-active").attr("aria-hidden", "false"));
        "ondemand" !== o.options.lazyLoad && "anticipated" !== o.options.lazyLoad || o.lazyLoad()
    }, t.prototype.setupInfinite = function () {
        var t, n, s, i = this;
        if (!0 === i.options.fade && (i.options.centerMode = !1), !0 === i.options.infinite && !1 === i.options.fade && (n = null, i.slideCount > i.options.slidesToShow)) {
            for (s = !0 === i.options.centerMode ? i.options.slidesToShow + 1 : i.options.slidesToShow, t = i.slideCount; t > i.slideCount - s; t -= 1) n = t - 1, e(i.$slides[n]).clone(!0).attr("id", "").attr("data-slick-index", n - i.slideCount).prependTo(i.$slideTrack).addClass("slick-cloned");
            for (t = 0; t < s + i.slideCount; t += 1) n = t, e(i.$slides[n]).clone(!0).attr("id", "").attr("data-slick-index", n + i.slideCount).appendTo(i.$slideTrack).addClass("slick-cloned");
            i.$slideTrack.find(".slick-cloned").find("[id]").each(function () {
                e(this).attr("id", "")
            })
        }
    }, t.prototype.interrupt = function (e) {
        e || this.autoPlay(), this.interrupted = e
    }, t.prototype.selectHandler = function (t) {
        var n = this, s = e(t.target).is(".slick-slide") ? e(t.target) : e(t.target).parents(".slick-slide"),
            i = parseInt(s.attr("data-slick-index"));
        i || (i = 0), n.slideCount <= n.options.slidesToShow ? n.slideHandler(i, !1, !0) : n.slideHandler(i)
    }, t.prototype.slideHandler = function (e, t, n) {
        var s, i, o, r, a, l, c = this;
        if (t = t || !1, !(!0 === c.animating && !0 === c.options.waitForAnimate || !0 === c.options.fade && c.currentSlide === e)) if (!1 === t && c.asNavFor(e), s = e, a = c.getLeft(s), r = c.getLeft(c.currentSlide), c.currentLeft = null === c.swipeLeft ? r : c.swipeLeft, !1 === c.options.infinite && !1 === c.options.centerMode && (e < 0 || e > c.getDotCount() * c.options.slidesToScroll)) !1 === c.options.fade && (s = c.currentSlide, !0 !== n ? c.animateSlide(r, function () {
            c.postSlide(s)
        }) : c.postSlide(s)); else if (!1 === c.options.infinite && !0 === c.options.centerMode && (e < 0 || e > c.slideCount - c.options.slidesToScroll)) !1 === c.options.fade && (s = c.currentSlide, !0 !== n ? c.animateSlide(r, function () {
            c.postSlide(s)
        }) : c.postSlide(s)); else {
            if (c.options.autoplay && clearInterval(c.autoPlayTimer), i = s < 0 ? c.slideCount % c.options.slidesToScroll != 0 ? c.slideCount - c.slideCount % c.options.slidesToScroll : c.slideCount + s : s >= c.slideCount ? c.slideCount % c.options.slidesToScroll != 0 ? 0 : s - c.slideCount : s, c.animating = !0, c.$slider.trigger("beforeChange", [c, c.currentSlide, i]), o = c.currentSlide, c.currentSlide = i, c.setSlideClasses(c.currentSlide), c.options.asNavFor && (l = (l = c.getNavTarget()).slick("getSlick")).slideCount <= l.options.slidesToShow && l.setSlideClasses(c.currentSlide), c.updateDots(), c.updateArrows(), !0 === c.options.fade) return !0 !== n ? (c.fadeSlideOut(o), c.fadeSlide(i, function () {
                c.postSlide(i)
            })) : c.postSlide(i), void c.animateHeight();
            !0 !== n ? c.animateSlide(a, function () {
                c.postSlide(i)
            }) : c.postSlide(i)
        }
    }, t.prototype.startLoad = function () {
        var e = this;
        !0 === e.options.arrows && e.slideCount > e.options.slidesToShow && (e.$prevArrow.hide(), e.$nextArrow.hide()), !0 === e.options.dots && e.slideCount > e.options.slidesToShow && e.$dots.hide(), e.$slider.addClass("slick-loading")
    }, t.prototype.swipeDirection = function () {
        var e, t, n, s, i = this;
        return e = i.touchObject.startX - i.touchObject.curX, t = i.touchObject.startY - i.touchObject.curY, n = Math.atan2(t, e), (s = Math.round(180 * n / Math.PI)) < 0 && (s = 360 - Math.abs(s)), s <= 45 && s >= 0 ? !1 === i.options.rtl ? "left" : "right" : s <= 360 && s >= 315 ? !1 === i.options.rtl ? "left" : "right" : s >= 135 && s <= 225 ? !1 === i.options.rtl ? "right" : "left" : !0 === i.options.verticalSwiping ? s >= 35 && s <= 135 ? "down" : "up" : "vertical"
    }, t.prototype.swipeEnd = function (e) {
        var t, n, s = this;
        if (s.dragging = !1, s.swiping = !1, s.scrolling) return s.scrolling = !1, !1;
        if (s.interrupted = !1, s.shouldClick = !(s.touchObject.swipeLength > 10), void 0 === s.touchObject.curX) return !1;
        if (!0 === s.touchObject.edgeHit && s.$slider.trigger("edge", [s, s.swipeDirection()]), s.touchObject.swipeLength >= s.touchObject.minSwipe) {
            switch (n = s.swipeDirection()) {
                case"left":
                case"down":
                    t = s.options.swipeToSlide ? s.checkNavigable(s.currentSlide + s.getSlideCount()) : s.currentSlide + s.getSlideCount(), s.currentDirection = 0;
                    break;
                case"right":
                case"up":
                    t = s.options.swipeToSlide ? s.checkNavigable(s.currentSlide - s.getSlideCount()) : s.currentSlide - s.getSlideCount(), s.currentDirection = 1
            }
            "vertical" != n && (s.slideHandler(t), s.touchObject = {}, s.$slider.trigger("swipe", [s, n]))
        } else s.touchObject.startX !== s.touchObject.curX && (s.slideHandler(s.currentSlide), s.touchObject = {})
    }, t.prototype.swipeHandler = function (e) {
        var t = this;
        if (!(!1 === t.options.swipe || "ontouchend" in document && !1 === t.options.swipe || !1 === t.options.draggable && -1 !== e.type.indexOf("mouse"))) switch (t.touchObject.fingerCount = e.originalEvent && void 0 !== e.originalEvent.touches ? e.originalEvent.touches.length : 1, t.touchObject.minSwipe = t.listWidth / t.options.touchThreshold, !0 === t.options.verticalSwiping && (t.touchObject.minSwipe = t.listHeight / t.options.touchThreshold), e.data.action) {
            case"start":
                t.swipeStart(e);
                break;
            case"move":
                t.swipeMove(e);
                break;
            case"end":
                t.swipeEnd(e)
        }
    }, t.prototype.swipeMove = function (e) {
        var t, n, s, i, o, r, a = this;
        return o = void 0 !== e.originalEvent ? e.originalEvent.touches : null, !(!a.dragging || a.scrolling || o && 1 !== o.length) && (t = a.getLeft(a.currentSlide), a.touchObject.curX = void 0 !== o ? o[0].pageX : e.clientX, a.touchObject.curY = void 0 !== o ? o[0].pageY : e.clientY, a.touchObject.swipeLength = Math.round(Math.sqrt(Math.pow(a.touchObject.curX - a.touchObject.startX, 2))), r = Math.round(Math.sqrt(Math.pow(a.touchObject.curY - a.touchObject.startY, 2))), !a.options.verticalSwiping && !a.swiping && r > 4 ? (a.scrolling = !0, !1) : (!0 === a.options.verticalSwiping && (a.touchObject.swipeLength = r), n = a.swipeDirection(), void 0 !== e.originalEvent && a.touchObject.swipeLength > 4 && (a.swiping = !0, e.preventDefault()), i = (!1 === a.options.rtl ? 1 : -1) * (a.touchObject.curX > a.touchObject.startX ? 1 : -1), !0 === a.options.verticalSwiping && (i = a.touchObject.curY > a.touchObject.startY ? 1 : -1), s = a.touchObject.swipeLength, a.touchObject.edgeHit = !1, !1 === a.options.infinite && (0 === a.currentSlide && "right" === n || a.currentSlide >= a.getDotCount() && "left" === n) && (s = a.touchObject.swipeLength * a.options.edgeFriction, a.touchObject.edgeHit = !0), !1 === a.options.vertical ? a.swipeLeft = t + s * i : a.swipeLeft = t + s * (a.$list.height() / a.listWidth) * i, !0 === a.options.verticalSwiping && (a.swipeLeft = t + s * i), !0 !== a.options.fade && !1 !== a.options.touchMove && (!0 === a.animating ? (a.swipeLeft = null, !1) : void a.setCSS(a.swipeLeft))))
    }, t.prototype.swipeStart = function (e) {
        var t, n = this;
        if (n.interrupted = !0, 1 !== n.touchObject.fingerCount || n.slideCount <= n.options.slidesToShow) return n.touchObject = {}, !1;
        void 0 !== e.originalEvent && void 0 !== e.originalEvent.touches && (t = e.originalEvent.touches[0]), n.touchObject.startX = n.touchObject.curX = void 0 !== t ? t.pageX : e.clientX, n.touchObject.startY = n.touchObject.curY = void 0 !== t ? t.pageY : e.clientY, n.dragging = !0
    }, t.prototype.unfilterSlides = t.prototype.slickUnfilter = function () {
        var e = this;
        null !== e.$slidesCache && (e.unload(), e.$slideTrack.children(this.options.slide).detach(), e.$slidesCache.appendTo(e.$slideTrack), e.reinit())
    }, t.prototype.unload = function () {
        var t = this;
        e(".slick-cloned", t.$slider).remove(), t.$dots && t.$dots.remove(), t.$prevArrow && t.htmlExpr.test(t.options.prevArrow) && t.$prevArrow.remove(), t.$nextArrow && t.htmlExpr.test(t.options.nextArrow) && t.$nextArrow.remove(), t.$slides.removeClass("slick-slide slick-active slick-visible slick-current").attr("aria-hidden", "true").css("width", "")
    }, t.prototype.unslick = function (e) {
        var t = this;
        t.$slider.trigger("unslick", [t, e]), t.destroy()
    }, t.prototype.updateArrows = function () {
        var e = this;
        Math.floor(e.options.slidesToShow / 2), !0 === e.options.arrows && e.slideCount > e.options.slidesToShow && !e.options.infinite && (e.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false"), e.$nextArrow.removeClass("slick-disabled").attr("aria-disabled", "false"), 0 === e.currentSlide ? (e.$prevArrow.addClass("slick-disabled").attr("aria-disabled", "true"), e.$nextArrow.removeClass("slick-disabled").attr("aria-disabled", "false")) : e.currentSlide >= e.slideCount - e.options.slidesToShow && !1 === e.options.centerMode ? (e.$nextArrow.addClass("slick-disabled").attr("aria-disabled", "true"), e.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false")) : e.currentSlide >= e.slideCount - 1 && !0 === e.options.centerMode && (e.$nextArrow.addClass("slick-disabled").attr("aria-disabled", "true"), e.$prevArrow.removeClass("slick-disabled").attr("aria-disabled", "false")))
    }, t.prototype.updateDots = function () {
        var e = this;
        null !== e.$dots && (e.$dots.find("li").removeClass("slick-active").end(), e.$dots.find("li").eq(Math.floor(e.currentSlide / e.options.slidesToScroll)).addClass("slick-active"))
    }, t.prototype.visibility = function () {
        var e = this;
        e.options.autoplay && (document[e.hidden] ? e.interrupted = !0 : e.interrupted = !1)
    }, e.fn.slick = function () {
        var e, n, s = this, i = arguments[0], o = Array.prototype.slice.call(arguments, 1), r = s.length;
        for (e = 0; e < r; e++) if ("object" == typeof i || void 0 === i ? s[e].slick = new t(s[e], i) : n = s[e].slick[i].apply(s[e].slick, o), void 0 !== n) return n;
        return s
    }
}), $.extend({
    HSCore: {
        init: function () {
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip(), $('[data-toggle="popover"]').popover()
            })
        }, components: {}
    }
}), $.HSCore.init(), function (e) {
    "use strict";
    e.HSCore.components.HSSlickCarousel = {
        defaults: {
            infinite: !1,
            pauseOnHover: !1,
            centerPadding: 0,
            lazyLoad: !1,
            prevArrow: null,
            nextArrow: null,
            autoplaySpeed: 3e3,
            speed: 300,
            initialDelay: 600,
            isThumbs: !1,
            isThumbsProgressCircle: !1,
            thumbsProgressContainer: null,
            thumbsProgressOptions: {color: "#000", width: 4},
            animationIn: null,
            animationOut: null,
            dotsWithIcon: null,
            dotsFromTitles: null,
            dotsAsProgressLine: !1,
            hasDotsHelper: !1,
            counterSelector: null,
            counterDivider: "/",
            counterClassMap: {
                current: "slick-counter-current",
                total: "slick-counter-total",
                divider: "slick-counter-divider"
            }
        }, init: function (t, n) {
            if (t.length) {
                var s = this, i = Object.assign({}, s.defaults),
                    o = t.attr("data-hs-slick-carousel-options") ? JSON.parse(t.attr("data-hs-slick-carousel-options")) : {},
                    r = {id: t.attr("id")};
                r = e.extend(i, r, o), r = e.extend(r, {
                    customPaging: function (t, n) {
                        var s = e(t.$slides[n]).data("hs-slick-carousel-slide-title");
                        return s && r.dotsWithIcon ? "<span>" + s + "</span>" + r.dotsWithIcon : r.dotsWithIcon ? "<span></span>" + r.dotsWithIcon : s && r.dotsFromTitles ? "<span>" + s + "</span>" : s && !r.dotsFromTitles ? '<span></span><strong class="dot-title">' + s + "</strong>" : "<span></span>"
                    }
                }, n), t.find("[data-slide-type]").length && s.videoSupport(t), t.on("init", function (e, n) {
                    s.transformOff(t, r, e, n)
                }), t.on("init", function (e, t) {
                    s.setCustomAnimation(e, t)
                }), r.animationIn && r.animationOut && t.on("init", function (e, t) {
                    s.setSingleClass(e, t)
                }), r.dotsAsProgressLine && t.on("init", function () {
                    s.setCustomLineDots(t, r)
                }), r.hasDotsHelper && t.on("init", function (e, t, n) {
                    s.setCustomDots(e, t, n)
                }), r.isThumbs && (r.isThumbsProgressCircle && t.on("init", function (e, n) {
                    s.setCustomProgressCircle(t, r, e, n)
                }), e("#" + r.id).on("click", ".slick-slide", function (t) {
                    t.stopPropagation(), s.goToTargetSlide(e(this), r)
                })), t.on("init", function (e, n) {
                    s.setCustomCurrentClass(t, e, n)
                }), t.on("init", function (e, t) {
                    s.setInitialCustomAnimation(e, t)
                }), r.counterSelector && t.on("init", function (e, t) {
                    s.setCounter(r, e, t)
                });
                var a = t.slick(r);
                return e(r.asNavFor)[0] && e(r.asNavFor)[0].dataset.hsSlickCarouselOptions && JSON.parse(e(r.asNavFor)[0].dataset.hsSlickCarouselOptions).isThumbsProgress && s.setInitialDelay(t, r), t.on("beforeChange", function (e, n, i, o) {
                    s.setCustomClasses(t, e, n, i, o)
                }), r.counterSelector && t.on("beforeChange", function (e, t, n, i) {
                    s.counting(r, e, t, n, i)
                }), t.on("afterChange", function (e, t) {
                    s.setCustomAnimation(e, t)
                }), r.animationIn && r.animationOut && (t.on("afterChange", function (e, t, n, i) {
                    s.animationIn(r, e, t, n, i)
                }), t.on("beforeChange", function (e, t, n) {
                    s.animationOut(r, e, t, n)
                }), t.on("setPosition", function (e, t) {
                    s.setPosition(r, e, t)
                })), a
            }
        }, transformOff: function (t, n, s, i) {
            var o = n;
            e(i.$slides).css("height", "auto"), o.isThumbs && o.slidesToShow >= e(i.$slides).length && t.addClass("slick-transform-off")
        }, setCustomAnimation: function (t, n) {
            var s = e(n.$slides)[n.currentSlide], i = e(s).find("[data-hs-slick-carousel-animation]");
            e(i).each(function () {
                var t = e(this).data("hs-slick-carousel-animation"),
                    n = e(this).data("hs-slick-carousel-animation-delay"),
                    s = e(this).data("hs-slick-carousel-animation-duration");
                e(this).css({
                    "animation-delay": n + "ms",
                    "animation-duration": s + "ms"
                }), e(this).addClass("animated " + t).css({opacity: 1})
            })
        }, setInitialCustomAnimation: function (t, n) {
            var s = e(n.$slides)[0], i = e(s).find("[data-hs-slick-carousel-animation]");
            e(i).each(function () {
                var t = e(this).data("hs-slick-carousel-animation");
                e(this).addClass("animated " + t).css("opacity", 1)
            })
        }, setSingleClass: function (t, n) {
            e(n.$slides).addClass("single-slide")
        }, setCustomDots: function (e) {
            var t = e.find(".js-dots");
            t.length && t.append('<span class="dots-helper"></span>')
        }, setCustomLineDots: function (t, n) {
            var s = t.find('[class="' + n.dotsClass + '"]'), i = s.find("li");
            s.length && (setTimeout(function () {
                t.addClass("slick-line-dots-ready")
            }), i.each(function () {
                e(this).append('<span class="dot-line"><span class="dot-line-helper" style="transition-duration: ' + (n.autoplaySpeed + n.speed) + 'ms;"></span></span>')
            }))
        }, setCustomProgressCircle: function (t, n, s, i) {
            var o = n, r = 0, a = e('<style type="text/css"></style>');
            e(i.$slides).each(function (t) {
                var n = e('<span class="slick-thumb-progress"><svg version="1.1" viewBox="0 0 160 160"><path class="slick-thumb-progress__path" d="M 79.98452083651917 4.000001576345426 A 76 76 0 1 1 79.89443752470656 4.0000733121155605 Z"></path></svg></span>'),
                    s = n.find("svg path");
                r = parseInt(s[0].getTotalLength()), e(i.$slides[t]).children(o.thumbsProgressContainer).append(n)
            }), a.text(".slick-thumb-progress .slick-thumb-progress__path {opacity: 0;fill: transparent;stroke: " + o.thumbsProgressOptions.color + ";stroke-width: " + o.thumbsProgressOptions.width + ";stroke-dashoffset: " + r + ";stroke-dashoffset: 0px;}.slick-current .slick-thumb-progress .slick-thumb-progress__path {opacity: 1;-webkit-animation: " + (i.options.autoplaySpeed + i.options.speed) + "ms linear 0ms forwards dash;-moz-animation: " + (i.options.autoplaySpeed + i.options.speed) + "ms linear 0ms forwards dash;-o-animation: " + (i.options.autoplaySpeed + i.options.speed) + "ms linear 0ms forwards dash;animation: " + (i.options.autoplaySpeed + i.options.speed) + "ms linear 0ms forwards dash;}@-webkit-keyframes dash {from {stroke-dasharray: 0 " + r + ";} to {stroke-dasharray: " + r + " " + r + ";}}@-moz-keyframes dash {from {stroke-dasharray: 0 " + r + ";} to {stroke-dasharray: " + r + " " + r + ";}}@-moz-keyframes dash {from {stroke-dasharray: 0 " + r + ";} to {stroke-dasharray: " + r + " " + r + ";}}@keyframes dash {from {stroke-dasharray: 0 " + r + ";} to {stroke-dasharray: " + r + " " + r + ";}}"), a.appendTo(t)
        }, goToTargetSlide: function (t, n) {
            var s = n, i = t.data("slick-index");
            e("#" + s.id).slick("slickCurrentSlide") !== i && e("#" + s.id).slick("slickGoTo", i)
        }, setCustomCurrentClass: function (t) {
            var n = t.find(".js-dots");
            n.length && e(n[0].children[0]).addClass("slick-current")
        }, setCounter: function (t, n, s) {
            var i = t;
            e(i.counterSelector).html('<span class="' + i.counterClassMap.current + '">1</span><span class="' + i.counterClassMap.divider + '">' + i.counterDivider + '</span><span class="' + i.counterClassMap.total + '">' + s.slideCount + "</span>")
        }, setInitialDelay: function (e, t) {
            var n = t;
            e.slick("slickPause"), setTimeout(function () {
                e.slick("slickPlay")
            }, n.initialDelay)
        }, setCustomClasses: function (t, n, s, i, o) {
            var r = e(s.$slides)[o], a = e(s.$slides)[i], l = t.find(".js-dots"),
                c = e(r).find("[data-hs-slick-carousel-animation]"),
                d = e(a).find("[data-hs-slick-carousel-animation]");
            e(d).each(function () {
                var t = e(this).data("hs-slick-carousel-animation");
                e(this).removeClass("animated " + t)
            }), e(c).each(function () {
                e(this).css({opacity: 0})
            }), l.length && (i > o ? (e(l[0].children).removeClass("slick-active-right"), e(l[0].children[o]).addClass("slick-active-right")) : e(l[0].children).removeClass("slick-active-right"), e(l[0].children).removeClass("slick-current"), setTimeout(function () {
                e(l[0].children[o]).addClass("slick-current")
            }, .25))
        }, animationIn: function (t, n, s, i, o) {
            var r = t;
            e(s.$slides).removeClass("animated set-position " + r.animationIn + " " + r.animationOut)
        }, animationOut: function (t, n, s, i) {
            var o = t;
            e(s.$slides[i]).addClass("animated " + o.animationOut)
        }, setPosition: function (t, n, s) {
            var i = t;
            e(s.$slides[s.currentSlide]).addClass("animated set-position " + i.animationIn)
        }, counting: function (t, n, s, i, o) {
            var r = t, a = (o || 0) + 1;
            e(r.counterSelector).html('<span class="' + r.counterClassMap.current + '">' + a + '</span><span class="' + r.counterClassMap.divider + '">' + r.counterDivider + '</span><span class="' + r.counterClassMap.total + '">' + s.slideCount + "</span>")
        }, videoSupport: function (t) {
            t.length && t.on("beforeChange", function (t, n, s, i) {
                var o, r = e(n.$slides[s]).data("slide-type"), a = e(n.$slides[s]).find("iframe").get(0);
                if ("vimeo" === r) o = {method: "pause", value: "true"}; else {
                    if ("youtube" !== r) return !1;
                    o = {event: "command", func: "pauseVideo"}
                }
                void 0 !== a && a.contentWindow.postMessage(JSON.stringify(o), "*")
            })
        }, initTextAnimation: function (t, n) {
            if (window.TextFx && window.anime && t.length) {
                var s = t.find(n);
                s.length && (s.each(function (t, n) {
                    var s = e(n);
                    s.data("TextFx") || s.data("TextFx", new TextFx(s.get(0)))
                }), t.on("beforeChange", function (e, t, s, i) {
                    var o = t.$slider.find(".slick-track").children(), r = o.eq(s), a = o.eq(i);
                    r = r.find(n), a = a.find(n), r.length && r.data("TextFx").hide(r.data("effect") ? r.data("effect") : "fx1"), a.length && a.data("TextFx").show(a.data("effect") ? a.data("effect") : "fx1")
                }))
            }
        }
    }
}(jQuery);