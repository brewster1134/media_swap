import './application.css'
import jQuery from 'jquery'
import $ from 'jquery'
import 'jquery-ujs'

function isTouchDevice() {
  return (('ontouchstart' in window) || (navigator.MaxTouchPoints > 0) || (navigator.msMaxTouchPoints > 0));
}

if (isTouchDevice()) {
  $('html').addClass('touch');
}
