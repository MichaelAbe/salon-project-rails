# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

backup nav

<nav class="grey">
  <div class="container">
    <%= link_to("Home", root_path, class: "brand-logo") %>
    <ul class="right">
      <% if user_signed_in? || employee_signed_in? %> 
          <ul>
            <li><%= link_to "Appointmnets", appointments_path %></li>
          </ul>
          <ul>
             <li><%= link_to "Schedule Appointmnets", new_appointment_path %></li>
          </ul>
          <ul>
              <li><%= link_to "Our Stylists", employees_path %></li>
          </ul>
          <ul>
              <li><%= link_to "Signout", destroy_user_session_path, method: "DELETE" %></li>
          </ul>
      <% else %>
          <ul>
              <li><%= link_to "I am NOT LOGGED IN", "#" %></li>
          </ul>
      <% end %>
    </ul>
  </div>
</nav>

 landing page backup

<li><%= link_to "Signup", signup_path %></li>
<li><%= link_to "Log In", login_path %></li>
<li><%= link_to "Log in with Google", '/auth/google_oauth2', method: :post %></li>

<%= link_to "Employee Login", employee_login_path %>