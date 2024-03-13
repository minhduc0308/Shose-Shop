<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Material Design Bootstrap</title>
  <!-- Roboto Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700&display=swap">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/bootstrap.min.css">
  <!-- Material Design Bootstrap -->
  <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb-pro.min.css">
  <!-- Material Design Bootstrap Ecommerce -->
  <link rel="stylesheet" href="https://mdbootstrap.com/previews/ecommerce-demo/css/mdb.ecommerce.min.css">
  <!-- Your custom styles (optional) -->
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ------>
       <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/> 

</head>

<body class="skin-light"">

  <!--Main Navigation-->
  <header>

 	 <jsp:include page="Menu.jsp"></jsp:include>

  </header>
  <!--Main Navigation-->

  <!--Main layout-->
  <main>
    <div class="container" style="margin-top:100px">

      <!--Grid row-->
      <div class="row mt-5">

        <!--Grid column-->
        <div class="col-md-4 mb-4">

          <!-- Section: Sidebar -->
          <section>

            <!-- Section: Categories -->
            <section>

              <h5>Categories</h5>

              <div class="text-muted small text-uppercase mb-5">
			<c:forEach items="${listCC}" var="o">
    <form action="categoryShop" method="GET">
        <input type="hidden" name="cid" value="${o.cid}">
        <button type="submit" class="btn btn-link card-link-secondary">${o.cname}</button>
    </form>
        

</c:forEach>


              </div>

            </section>
            <!-- Section: Categories -->

            <!-- Section: Filters -->
            <section>

              <h5 class="pt-2 mb-4">Filters</h5>

              <section class="mb-4">
    <div class="md-form md-outline mt-0 d-flex justify-content-between align-items-center">
        <form action="searchShop" method="GET"> 
            <input name="txt" type="text" class="form-control mb-0" placeholder="Search..." value="${txtS}">
            <button type="submit" class="btn btn-flat btn-md px-3 waves-effect"><i class="fas fa-search fa-lg"></i></button>
        </form>
    </div>
</section>


          
              <!-- Section: Price -->
              <section class="mb-4">
    <h6 class="font-weight-bold mb-3">Price</h6>

    <form action="searchPriceUnder100Shop" method="GET">
        <div class="form-check pl-0 mb-3">
            <label class="form-check-label small text-uppercase card-link-secondary" for="under100">Under $100</label>
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <form action="searchPrice100To200Shop" method="GET">
        <div class="form-check pl-0 mb-3">
            <label class="form-check-label small text-uppercase card-link-secondary" for="100200">$100 to $200</label>
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <form action="searchPriceAbove200Shop" method="GET">
        <div class="form-check pl-0 mb-3">
            <label class="form-check-label small text-uppercase card-link-secondary" for="200above">$200 & Above</label>
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <form id="priceForm" action="searchPriceMinToMax" method="GET">
        <div class="d-flex align-items-center mt-4 pb-1">
            <div class="md-form md-outline my-0">
                <input id="priceMin" type="text" class="form-control mb-0" name="priceMin" oninput="submitForm()">
                <label for="priceMin">$ Min</label>
            </div>
            <p class="px-2 mb-0 text-muted"> - </p>
            <div class="md-form md-outline my-0">
                <input id="priceMax" type="text" class="form-control mb-0" name="priceMax" oninput="submitForm()">
                <label for="priceMax">$ Max</label>
            </div>
        </div>
        <button type="submit" class="btn btn-primary mt-2">Search</button>
    </form>
</section>

              <!-- Section: Price -->


             

              <!-- Section: Color -->
              <section class="mb-4">
    <h6 class="font-weight-bold mb-3">Color</h6>

    <form action="searchColorWhite" method="GET">
        <button type="submit" class="btn rounded-circle white border-inset-grey p-3 m-2"></button>
    </form>

    <form action="searchColorGray" method="GET">
        <button type="submit" class="btn rounded-circle grey p-3 m-2"></button>
    </form>

    <form action="searchColorBlack" method="GET">
        <button type="submit" class="btn rounded-circle black p-3 m-2"></button>
    </form>

    <form action="searchColorYellow" method="GET">
        <button type="submit" class="btn rounded-circle yellow p-3 m-2"></button>
    </form>
</section>

              <!-- Section: Color -->

            </section>
            <!-- Section: Filters -->

          </section>
          <!-- Section: Sidebar -->

        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-md-8 mb-4">

          <!-- Section: Block Content -->
          <section class="mb-3">

            <div class="row d-flex justify-content-around align-items-center">
              <div class="col-12 col-md-3 text-center text-md-left">
              </div>
              <div class="col-12 col-md-5">
                <div class="d-flex flex-wrap">
                  <div class="select-outline position-relative w-100">
                    <select class="mdb-select md-outline md-form" searchable="Search here..">
                      <option value="" disabled selected>Choose category</option>
                      <option value="1">Category 1</option>
                      <option value="2">Category 2</option>
                      <option value="3">Category 3</option>
                      <option value="4">Category 4</option>
                      <option value="5">Category 5</option>
                    </select>
                    <label>Tất cả sản phẩm</label>
                    <button class="btn-save btn btn-primary btn-sm mt-2">Save</button>
                  </div>
                </div>
              </div>
              <div class="col-12 col-md-4 text-center">
                <nav aria-label="Page navigation example">
                  <ul class="pagination pagination-circle justify-content-center float-md-right mb-0">
                  <c:if test="${tag != 1}">
                    <li class="page-item"><a href="shop?index=${tag-1 }" class="page-link"><i class="fas fa-chevron-left"></i></a></li>
                    </c:if> 
                    <c:forEach begin="1" end="${endPage }" var="i">
                    <li class="${tag==i?"page-item active":"page-item" }"><a href="shop?index=${i }" class="page-link">${i }</a></li>
                    </c:forEach>
                <c:if test="${tag != endPage}">
                    <li class="page-item"><a href="shop?index=${tag+1 }" class="page-link"><i class="fas fa-chevron-right"></i></a></li>
                     </c:if> 
                  </ul>
                </nav>
              </div>
            </div>

          </section>
          <!-- Section: Block Content -->

          <!--Section: Block Content-->
          <section>

            <!-- Grid row -->
            <div class="row" id="content">


<c:forEach items="${listP}" var="o">
              <!-- Grid column -->
              <div class="col-md-4 mb-5">

                <!-- Card -->
                <div class="">

                  <div class="view zoom overlay rounded z-depth-2">
                    <img class="img-fluid w-100"
                      src="${o.image }" alt="Sample">
                    <a href="detail?pid=${o.id}">
                      <div class="mask">
                        <img class="img-fluid w-100"
                          src="${o.image }">
                        <div class="mask rgba-black-slight"></div>
                      </div>
                    </a>
                  </div>

                  <div class="text-center pt-4">

                    <h5>${o.name }</h5>
                    <p><span class="mr-1"><strong>${o.price }$</strong></span></p>

                  </div>

                </div>
                <!-- Card -->

              </div>
              <!-- Grid column -->
   </c:forEach>     
              
            </div>
            <!-- Grid row -->
          </section>
          <!--Section: Block Content-->

    </div>
  </main>
  <!--Main layout-->

  <!-- Footer -->
  

   <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!-- Footer -->



  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script src="https://mdbootstrap.com/previews/ecommerce-demo/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
    <!-- MDB Ecommerce JavaScript -->
    <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
  <script>
    $('#multi').mdbRange({
      single: {
        active: true,
        multi: {
          active: true,
          rangeLength: 1
        },
      }
    });

    $(document).ready(function () {
      $('.mdb-select').materialSelect();
      $('.select-wrapper.md-form.md-outline input.select-dropdown').bind('focus blur', function () {
        $(this).closest('.select-outline').find('label').toggleClass('active');
        $(this).closest('.select-outline').find('.caret').toggleClass('active');
      });
    });  
    
    
    function searchByColorWhite(){
        $.ajax({
            url: "/ASM_WebsiteBanGiay1/searchAjaxColorWhite",
            type: "get", //send it through get method
            data: {
               
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    function searchByColorGray(){
        $.ajax({
            url: "/ASM_WebsiteBanGiay1/searchAjaxColorGray",
            type: "get", //send it through get method
            data: {
               
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    function searchByColorBlack(){
        $.ajax({
            url: "/ASM_WebsiteBanGiay1/searchAjaxColorBlack",
            type: "get", //send it through get method
            data: {
               
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    function searchByColorYellow(){
        $.ajax({
            url: "/ASM_WebsiteBanGiay1/searchAjaxColorYellow",
            type: "get", //send it through get method
            data: {
               
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
    function loadAmountCart(){
    	 $.ajax({
             url: "/ASM_WebsiteBanGiay1/loadAllAmountCart",
             type: "get", //send it through get method
             data: {
                 
             },
             success: function (responseData) {
                 document.getElementById("amountCart").innerHTML = responseData;
             }
         });
    }         
  </script>
  	 <!-- MDB -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript" src="js/script.js"></script>
</body>

</html>