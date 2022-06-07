$('#add').on('click', function(){
    $(".order-items").prepend('<li class="order-item"><div><img src="../img/img-10.jpg"><p class="item-name">Gà rang cháy tỏi</p></div><span class="quanlity"><button id="minus">-</button><input id="sl" type="number" value="1" style="width: 40px;height : 40px;"><button id="plus">+</button></span> <span class="price"><span  class="money gia">65.000</span></span><span class="price"><span  class="money subtotal">65.000</span></span><span class="price"><button id="remove">X</button></span></li>')
});
$(document).on('click','#minus', function(){
     var quantity = $(this).parent().parent().find('#sl').val();
        quantity =parseInt(quantity);
        console.log(quantity);
        if(quantity >0){
            quantity -=1;
        }
     $(this).parent().parent().find('#sl').val(quantity);
})
$(document).on('click','#plus', function(){
    var quantity = $(this).parent().parent().find('#sl').val();
       quantity =parseInt(quantity);
       console.log(quantity);
        quantity +=1;
        $(this).parent().parent().find('#sl').val(quantity);
})
$(document).on('click','#remove', function(){
    $(this).parent().parent().remove();
    
});

Ganchuoi();
function Ganchuoi(){
    var shipping = $('#shipping').text();
    var shipping = parseInt(shipping);
   
    var subtotals = 0;
    $('.subtotal').each(function () {
        var subtotalt = $(this).text();
        var subtotalr = subtotalt.split('.').join('');
         var subtotal = subtotalr.slice(0,subtotalr.length-3);
        subtotal = parseInt(subtotal);
        console.log(subtotal);
        subtotals += subtotal;
    })
   
    let formatsubtotals = subtotals.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString();
    var total = subtotals + shipping;
    let formattotal = total.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString();
    console.log(formatsubtotals);
   $('.subtotals').text(formatsubtotals);
    $('#total').text(formattotal);
}
$(document).on('click', '#plus', function (){
    var quantity = $(this).parent().parent().find('#sl').val();
    quantity = parseInt(quantity);
    var price =  $(this).closest('li').find('.gia').text();
    price = parseInt(price);
    var subtotal = $(this).closest('li').find('.subtotal').text();
    subtotal = parseInt(subtotal);
     subtotal = quantity * price;
    let format = subtotal.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString() + " đ";
    $(this).closest('li').find('.subtotal').text(format);
    Ganchuoi();
});
$(document).on('click', '#minus', function (){
    var quantity = $(this).parent().parent().find('#sl').val();
    quantity = parseInt(quantity);
    var price =  $(this).closest('li').find('.gia').text();
    console.log(price);
    price = parseInt(price);
    var subtotal = $(this).closest('li').find('.subtotal').text();
    subtotal = parseInt(subtotal);
    subtotal = quantity * price;
    let format = subtotal.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString()+ " đ";
    $(this).closest('li').find('.subtotal').text(format);
    Ganchuoi();
});
$(document).on('click', '#add', function (){
    var quantity = $(this).parent().parent().find('#sl').val();
    quantity = parseInt(quantity);
    var price = $('.gia').text();
    console.log(price);
    price = parseInt(price);
    var subtotal = $(this).closest('li').find('.subtotal').text();
    subtotal = parseInt(subtotal);
    subtotal = quantity * price;
    let format = subtotal.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString();
    $(this).closest('li').find('.subtotal').text(format);
    Ganchuoi();
});
$(document).on('click', '#remove', function (){
    var quantity = $(this).parent().parent().find('#sl').val();
    quantity = parseInt(quantity);
    var price =  $(this).closest('li').find('.gia').text();
    console.log(price);
    price = parseInt(price);
    var subtotal = $(this).closest('li').find('.subtotal').text();
    subtotal = parseInt(subtotal);
    subtotal = quantity * price;
    let format = subtotal.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString()+ " đ";
    $(this).closest('li').find('.subtotal').text(format);
    Ganchuoi();
});
$(document).on('change', '#sl', function (){
    var quantity = $(this).parent().parent().find('#sl').val();
    quantity = parseInt(quantity);
    var price =  $(this).closest('li').find('.gia').text();
    console.log(price);
    price = parseInt(price);
    var subtotal = $(this).closest('li').find('.subtotal').text();
    subtotal = parseInt(subtotal);
    subtotal = quantity * price;
    let format = subtotal.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString();
    $(this).closest('li').find('.subtotal').text(format);
    Ganchuoi();
});

