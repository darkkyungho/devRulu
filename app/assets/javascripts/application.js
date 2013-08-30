// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.tokeninput
//= require turbolinks
//= require_tree .

function initPage() {
    //좋아요 초기화
    var initPostLike = function () {
        var like = function (evt) {
            var postID = $(this).data('post-id');
            console.log(postID);
        };
        $('.likePost').on('click', {}, like);
    }
    initPostLike();
}


$(document).ready(function () {
    initPage();
});
