function InitiateSearchResultPage() {
    $.ajax({
        url: $('#GetFilterUrl').val(),
        data: { category_Id: $('#foodCategory').val() },
        type: "POST",
    }).success(function (data) {
        if (data) {

            if (data.hasOwnProperty('Filters')) {
                $.each(data.Filters, function (i, item) {
                    $('#advanceFilterDdl').append('<option value="' + item.Value + '">' + item.Text + '</option>');
                });
            }

            if (data.hasOwnProperty('Cuisines')) {
                $.each(data.Cuisines, function (i, item) {
                    $('#CusineFilterDdl').append('<option value="' + item.Value + '">' + item.Text + '</option>');
                });
            }
        } else {
            $('#advanceFilterDdl').remove('option').not('option[Value=""]');
        }
    }).error(function () {
        alert("Some Error Occured. Please try after some time");
    });

    $('#CusineFilterDdl').change(function () {
        var selectedCuisineID = $.trim($(this).val());
        if (selectedCuisineID != "") {
            $.ajax({
                url: $('#GetSubCuisinesUrl').val(),
                data: { cuisineID: $(this).val() },
                type: "POST",
            }).success(function (data) {
                if (data && data.length > 0) {
                    $.each(data, function (i, item) {
                        $('#SubCusineFilterDdl').append('<option value="' + item.Value + '">' + item.Text + '</option>');
                    });
                }
            }).error(function () {
                alert("Some Error Occured. Please try after some time");
            });
        } else {
            $('#SubCusineFilterDdl option').not('option[value=""]').remove();
        }
    });
}


function GetMenu(obj) {
    $('#searh-result-div').slideUp('fast');
    $.ajax({
        url: $(obj).attr('data-url'),
        data: { restID: $(obj).attr('data-restID'), catId: $(obj).attr('data-catId') },
        type: "POST",
    }).success(function (data) {
        $('#restraunt-menu-div').html(data);
        $('#restraunt-menu-div').slideDown('slow');
        ReSizeHeight();
    }).error(function () {
        alert("Some Error Occured");
    });
}
function outputUpdate(vol) {
    document.querySelector('#cost').value = vol;
}
function ReSizeHeight() {
    $('.filter-height').css('height', $('.search-result-list-div').css('height'));
}
function GetFilteredResult() {
    $('#FoodListPartialViewDiv').slideUp('fast');
    $('#restraunt-menu-div').hide();
    var jsonData = $('#SearchFoodCat').serialize();
    jsonData += '&' + $('#CustomFilterForm').serialize();

    AjaxCall($('#SearchFoodCat').attr('action'), jsonData, "POST", true)
        .success(function (result) {
            if (result) {
                $('#FoodListPartialViewDiv').html(result);
                $('#FoodListPartialViewDiv').slideDown('slow')
            }
        })
        .error(function () {
            alert("Some Error Occured");
        });
}

function InitiateLayoutPage() {
    $('#citiesDdl').change(function () {
        var selectedCity = $.trim($(this).val());
        $('#searh-result-div').html("");
        if (selectedCity != "") {
            $('#locationDdl').html("<option value=''>Select Location</option>")
            $.ajax({
                url: $('#locationURL').val(),
                data: { cityId: selectedCity },
                type: "POST"
            }).success(function (data) {
                if (data) {
                    $.each(JSON.parse(data), function (i, item) {
                        $('#locationDdl').append("<option value='" + item.id + "'>" + item.name + "</option>")
                        $('#locationDdl').removeAttr('disabled');
                    });
                }
            }).error(function () {
                alert("Some Error Occured");
            });
        } else {
            $('#locationDdl').val('').attr('disabled', 'disabled');
        }
    });

    $('#SearchFoodCat').submit(function (e) {
        e.preventDefault();
        $('#searh-result-div').hide();
        $('#restraunt-menu-div').hide();

        AjaxCall($(this).attr('action'), $(this).serialize(), "POST", true)
       .success(function (result) {
           if (result) {
               $('#searh-result-div').html(result);
               $('#searh-result-div').slideDown('slow');
           }
       })
       .error(function () {
           alert("Some Error Occured");
       });
    });
}