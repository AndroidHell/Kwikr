//this is stuff I added along the way while going through the tutorial

//needed to add the sidebar slide out on smaller screens
$(document).ready(function() {   
    var sideslider = $('[data-toggle=collapse-side]');
    var sel = sideslider.attr('data-target');
    var sel2 = sideslider.attr('data-target-2');
    sideslider.click(function(event){
        $(sel).toggleClass('in');
        $(sel2).toggleClass('out');
    });
});

//needed to get the dropdown working properly.  
$(document).ready(function() {
  $(".dropdown-toggle").dropdown();
});

//animated hamburger button - uses navbar-toggle so no need changing there.
$(document).ready(function () {
	  $(".navbar-toggle").on("click", function () {
		    $(this).toggleClass("active");
	  });
});

