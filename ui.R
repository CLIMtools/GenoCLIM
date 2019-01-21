
library(ggplot2)
library(shiny)
library(shinythemes)
library(DT)
library(shinycssloaders)
library(shinyjqui)
library(shinyjs)
library(markdown)

shinyUI(fluidPage(
  # Add Javascript
  tags$head(
    tags$link(rel="stylesheet", type="text/css",href="style.css"),
    tags$head(includeScript("google-analytics.js")),
    tags$script(type="text/javascript", src = "md5.js"),
    tags$script(type="text/javascript", src = "passwdInputBinding.js"),
    tags$script('!function(d,s,id){var js,fjs=d.getElementsByTagName(s)    [0],p=/^http:/.test(d.location)?\'http\':\'https\';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");')
    
  ),
  useShinyjs(),
  
  uiOutput("app"),
  headerPanel(
    list(tags$head(tags$style("body {background-color: white; }")),
         "                     GenoCLIM", HTML('<img src="picture2.png", height="100px",  
                           style="float:left"/>','<p style="color:blue">                    Find Your Gene’s Environmental Association </p>' ))
  ),
  
  theme = shinytheme("cerulean") , 
  
  
  tabsetPanel(              
    tabPanel(type = "pills", title = "Find your gene",(jqui_draggable(sidebarPanel(
      wellPanel(a(h4('Please cite us in any publication that utilizes information from Arabidopsis CLIMtools:'),  href = "https://www.nature.com/articles/s41559-018-0754-5", h6('Ferrero-Serrano, Á & Assmann SM. Phenotypic and genome-wide association with the local environment of Arabidopsis. Nature Ecology & Evolution. doi: 10.1038/s41559-018-0754-5 (2019)' ))),
      
      #    wellPanel(
      #      uiOutput("datasets")
      #    ),
      #uiOutput("ui_Manage")
      uiOutput("ui_All"),
      width=3, wellPanel(tags$a(img(src='genoclimwarning.png', h3("Considerations before using this tool"), height="120px"),href="myfile.pdf"),align="center"), wellPanel(tags$a(img(src='FDR.png', h3("Explore FDR of any ExG association"), height="120px"),href="myfile.pdf"),align="center"), wellPanel(a("Tweets by @ClimTools", class="twitter-timeline"
                                                                                                                                                                                                                                                                                                              , href = "https://twitter.com/ClimTools"), style = "overflow-y:scroll; max-height: 1000px"
      ),
      wellPanel( h6('Contact us: clim.tools.lab@gmail.com')), wellPanel(tags$a(div(
        img(src = 'github.png',  align = "middle"), style = "text-align: center;"
      ), href = "https://github.com/CLIMtools/GenoCLIM"))
    )
      
      ###################################################
            
                                                                       
                                                                       
                                                                       ###################################################
    )                 
    
    ),
    
                             ###################################################
          
    mainPanel(  
        ###add code to get rid of error messages on the app.   
        tags$style(type="text/css",
                   ".shiny-output-error { visibility: hidden; }",
                   ".shiny-output-error:before { visibility: hidden; }"
        ),
             
  # Create a new row for the table.
  fixedRow(column(6,h4("Type your locus of interest in the search box to explore the association between its genetic variation with any geoclimatic variable"),
    withSpinner(DT::dataTableOutput("table"))
    
  )))), 
  tabPanel(title = "Description of climate variables",  mainPanel(fixedRow(
    width = 12,
    withSpinner(DT::dataTableOutput("a"))
  ))),
  
  tabPanel(title = "About",  mainPanel(h1(div('About GenoCLIM', style = "color:blue")), 
                                       h3(div('GenoCLIM is an SHINY component of CLIMtools, that provides an intuitive tool to explore the environmental variation associated to any gene or variant of interest in Arabidopis.', style = "color:grey")),
                                       h3(div('GenoCLIM allows the user to input the locus ID, genetic position or keyword within a particular locus description to explore its association with any oif the multiple environmental variables available from CLIMtools ', style = "color:grey")),
                                       h3(''),
                                       
                                       
                                       div(tags$a(img(src='shiny.png',  height="100px"),href="https://shiny.rstudio.com/"),
                                           tags$a(img(src='rstudio.png',  height="100px"),href="https://www.rstudio.com/"),
                                           tags$a(img(src='1001.png',  height="100px"),href="http://1001genomes.org/"),  align="middle", style="text-align: center;"),
                                       
                                       h3(''),
                                       h3(''),
                                       tags$a(div(img(src='climtools.png',  align="middle"), style="text-align: center;"), href="http://www.personal.psu.edu/sma3/CLIMtools.html"),
                                       tags$a(div(img(src='climtools logo.png',  align="middle"), style="text-align: center;"), href="http://www.personal.psu.edu/sma3/CLIMtools.html"),
                                       
                                       h3(''),
                                       tags$a(div(img(src='assmann_lab.png',  align="middle"), style="text-align: center;"), href="http://www.personal.psu.edu/sma3/index.html")
                                       
  )))
  
))
           
