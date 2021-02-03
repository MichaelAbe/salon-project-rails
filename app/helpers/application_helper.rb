module ApplicationHelper
    def render_nav_links(signed_in) 
        if signed_in #is logged in
            content_tag("ul") do 
                content_tag("li") do #appointments
                    link_to("Appointments", appointments_path)
                end +
                content_tag("li") do #schdule appointment
                    link_to("Schedule Appointment", new_appointment_path)
                end +
                content_tag("li") do #Employee index
                    link_to("Our Stylists", employees_path)
                end 
                content_tag("li") do #sign out
                    link_to("Sign Out", destroy_session_path, method: "DELETE")
                end    
            end   
        else
            content_tag("ul") do 
                content_tag("li") do #login
                    link_to("Login", "#")
                end +
                content_tag("li") do #signup
                    link_to("Signup", "#")
                end
            end 
        end  
    end
end
