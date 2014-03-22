<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>
   
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">



<link href="Styles/popbox.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <!--<script type='text/javascript' charset='utf-8' src='scripts/jquery-1.4.1.min.js'></script>-->
  <script type='text/javascript' charset='utf-8'>
      (function () {

          $.fn.popbox = function (options) {
              var settings = $.extend({
                  selector: this.selector,
                  open: '.open',
                  box: '.box',
                  arrow: '.arrow',
                  arrow_border: '.arrow-border',
                  close: '.close'
              }, options);

              var methods = {
                  open: function (event) {
                      event.preventDefault();

                      var pop = $(this);
                      var box = $(this).parent().find(settings['box']);

                      box.find(settings['arrow']).css({ 'left': box.width() / 2 - 10 });
                      box.find(settings['arrow_border']).css({ 'left': box.width() / 2 - 10 });

                      if (box.css('display') == 'block') {
                          methods.close();
                      } else {
                          box.css({ 'display': 'block', 'top': 10, 'left': ((pop.parent().width() / 2) - box.width() / 2) });
                      }
                  },

                  close: function () {
                      $(settings['box']).fadeOut("fast");
                  }
              };

              $(document).bind('keyup', function (event) {
                  if (event.keyCode == 27) {
                      methods.close();
                  }
              });

              $(document).bind('click', function (event) {
                  if (!$(event.target).closest(settings['selector']).length) {
                      methods.close();
                  }
              });

              return this.each(function () {
                  $(this).css({ 'width': $(settings['box']).width() }); // Width needs to be set otherwise popbox will not move when window resized.
                  $(settings['open'], this).bind('click', methods.open);
                  $(settings['open'], this).parent().find(settings['close']).bind('click', function (event) {
                      event.preventDefault();
                      methods.close();
                  });
              });
          }

      }).call(this);


  </script>
  <style type='text/css' media='screen'>
    body {
      text-align:center;
      background:#f7f7f7;
      font-family:georgia;
      font-size:22px;
      text-shadow:1px 1px 1px #FFF;
      margin:200px;
    }

    a { color:#999; text-decoration:none; }
    label { display: block; }
    form { margin: 25px; text-align:left }
    form input[type=text] { padding:5px; width:90%; border:solid 1px #CCC;}
    form textarea { padding:5px; width:90%; border:solid 1px #CCC; height:100px;}

    .box { width:350px; }

     footer {
       font-size:12px;
     }
     form a, footer a { color:#40738d; }
  </style>
  <script type='text/javascript' charset='utf-8'>
      $(document).ready(function () {
          $('.popbox').popbox();
      });
  </script>


  <h1>PopBox</h1>

  <div class='popbox'>
    <a class='open' href='#'>Click Here! </a>

    <div class='collapse'>
      <div class='box'>
        <div class='arrow'></div>
        <div class='arrow-border'></div>

        <form action="http://gristmill.createsend.com/t/j/s/nklki/" method="post" id="subForm">
          <p><small>Please give reason for rejection. </small></p>
          
        
          <div class="input">
          <asp:TextBox ID="comments" runat="server" Rows="5" Height="60px" MaxLength="150"></asp:TextBox>
            
          </div>
          <p>
          <input type="submit" value="Reject" />  <input type='reset' value='Cancel' />
        </p>
        </form>

      </div>
    </div>
  </div>

  <p>jQuery PopBox is a simple, HighRise inspired balloon UI element.</p>

 

</asp:Content>
