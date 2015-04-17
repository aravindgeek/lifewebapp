var showSlide1 = function(){
    $("#slide3").css("display","none");
    $("#slide1").css("display","block");
    $("#slide1").animate({opacity:1.0},2000);
    $("#slide1").animate({opacity:0.0},2000);
    setTimeout(showSlide2,4000);
    }
var showSlide2 = function(){

    $("#slide1").css("display","none");
    $("#slide2").css("display","block");
    $("#slide2").animate({opacity:1.0},2000);
    $("#slide2").animate({opacity:0.0},2000);
    setTimeout(showSlide3,4000);
    }
var showSlide3 = function(){

    $("#slide2").css("display","none");
    $("#slide3").css("display","block");
    $("#slide3").animate({opacity:1.0},2000);
    $("#slide3").animate({opacity:0.0},2000);
    setTimeout(showSlide1,4000);

    }
$("document").ready(function(){
    showSlide1();
});

