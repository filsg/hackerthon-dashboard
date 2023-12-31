library(shiny)
library(shinydashboard)
library(plotly)
library(flexdashboard)
library(DT)
library(sunburstR)
percentage <- c(26,45,12,25)
dashboardPage(

  dashboardHeader(title = "LABOUR FORCE",
                 titleWidth =650,
 tags$li(class ="dropdown", tags$a(href="https://www.youtube.com/", icon("youtube"), "My Channel", target="_blank")),
 tags$li(class ="dropdown", tags$a(href="https://www.instagram.com/", icon("instagram"), "My profile", target="_blank")),
tags$li(class ="dropdown", tags$a(href="https://github.com/", icon("github"), "sorce code", target="_blank"))


  ),

dashboardSidebar(
  # sidebarmenu
  sidebarMenu(
    id ="sidebar",
    #first menuitem
    menuItem("dataset", tabName = "data", icon = icon("database")),
    menuItem(text = "visualization", tabName = "Viz", icon = icon("chart-line"))


)

),
dashboardBody(

  tabItems(
    # first tab item
    tabItem(tabName = "data", downloadButton("downloadDatap1","download education data",style = "background-color:black;color: yellow;border: none;border-radius: 5Px; padding: 10Px 20Px;"),
            # tab box
            tabBox(id="t1",width = 12,
                   tabPanel("About", icon=icon("address-card"), style = "width: 1400Px;height: 600Px;background-color: lightgreen;", HTML("<p style='color:rose;text_align:center;font:italic;font-size:40Px'>ABOUT RWANDAN LABOR FORCE IN 2022 CENSUS </p>"),
                            imageOutput("image2")
             ),




 tabPanel(title= "Data", icon = icon("address-card"),style = "width: 1400Px;height: 600Px;background-color: lightgray;",

          fluidRow( column(width = 6,HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>LABOR FORCE DATA  FOR EDUCATION STATUS</p>")), dataTableOutput("dataT")),

   fluidRow( column(width = 6,HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>LABOR FORCE DATA FOR ECONOMIC ACTIVITIES</p>")),dataTableOutput("dataz")),
   fluidRow( column(width = 6,HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>LABOR FORCE DATA FOR LABOR WITH DISABLITY</p>")),dataTableOutput("datax"))),
                   tabPanel(title= "structure", icon = icon("address-card"),style = "width: 1900Px;height: 600Px;background-color: lightgray;",
  fluidRow( column(width = 6,HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>LABOR FORCE STRUCURE  FOR EDUCATION STATUS</p>")), verbatimTextOutput("structure1")),
 fluidRow( column(width = 6,HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>LABOR FORCE STRUCURE </p>")), verbatimTextOutput("structure2")),
 fluidRow( column(width = 6,HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>LABOR FORCE STRUCURE  WITH DISABLITIES</p>")), verbatimTextOutput("structure3"))),
  tabPanel(title= "summary stats", icon = icon("address-card"), style = "width: 1900Px;height: 600Px;background-color: lightgray;",
           fluidRow( column(width = 6,HTML("<p style='color:blue;align: right;font:italic;font-size:20Px'>SUMMARY stat on education and labor force </p>")),verbatimTextOutput("summary1")),
fluidRow( column(width = 6,HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>SUMMARY stat on labor force </p>")),verbatimTextOutput("summary2")),
fluidRow( column(width = 6,HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>summary stat on disablities </p>")),verbatimTextOutput("summary3"))))

),
# second tab item or landing page is here..
tabItem(tabName = "map",
        tabBox(id="t2",width = 12,

               tabPanel(title ="total population", value = "relation",h4("dfghj") ),

               tabPanel(title ="economic activities", value = "relation",),
               tabPanel(title ="Underutilization", value = "relation", h4("map showing underutilization of labour force"))


  )),

# third tab item or landing page is here..
tabItem(tabName = "Viz",downloadButton("downloadDatap","download labour force data ",style = "background-color: black;color: yellow;border: none;border-radius: 5Px; padding: 10Px 20Px;"),
        downloadButton("downloadData","download education data",style = "background-color: black;color: yellow;border: none;border-radius: 5Px; padding: 10Px 20Px;"),
        tabBox(id="t2",width = 12,
               tabPanel(title ="LABOR FORCE", icon = icon("address_card"),style = "width: 1260Px;height: 2300Px;background-color: lightgreen;",
 fluidRow( column(width = 6,HTML("<p style='color:darkblue;align: right;font:italic;font-size:20Px'>The visualization of labor force</p>"),plotOutput("labor") ),
                  box(title = "",HTML("<p style='color:darkblue;font:italic;font-size:20Px'>the percentage of labor force to population ratio</p>"),gaugeOutput("laborforce1"))),

           fluidRow( column(width = 6,HTML("<p style='color:darkblue;align: right;font:italic;font-size:20Px'>The visualization of underutilization labor force</p>"),plotOutput("underutilization") ),
                            box(title = "",HTML("<p style='color:darkblue;font:italic;font-size:20Px'>the percentage of underutilization to population ratio</p>"),gaugeOutput("under"))),


 fluidRow( column(width = 6,HTML("<p style='color:darkblue;align: right;font:italic;font-size:20Px'>youth labor force</p>"),plotOutput("laboryouth") ),
           box(title = "",HTML("<p style='color:darkblue;font:italic;font-size:20Px'>the percentage of youth in labor force</p>"),gaugeOutput("lyouth"))),


 fluidRow( column(width = 6,HTML("<p style='color:darkblue;align: right;font:italic;font-size:20Px'>the visualization of outside labor force</p>"),plotOutput("outsidelabor")),
box(title = "",HTML("<p style='color:darkblue;font:italic;font-size:20Px'>the percentage of outside labor force to labor force ratio</p>"),gaugeOutput("unemployedrate"))),imageOutput("disability")



                     ),
               tabPanel(title ="EMPLOYEMENT STATUS", value = "distro",style = "width: 1200Px;height: 2500Px;background-color: lightgreen;",
                        fluidRow(column(width =12,
                          box(title = "",HTML("<p style='color:rose;text_align:center;font:italic;font-size:30Px'>employement and unemployment </p>"),imageOutput("image3")))),


fluidRow( column(width = 6,HTML("<p style='color:darkblue;align: right;font:italic;font-size:20Px'>Vizualization of unemployment in labor force of RWANDA </p>"),plotOutput("unemployed") ),
  box(title = "",HTML("<p style='color:darkblue;font:italic;font-size:20Px'>the percentage of unemployment to labor force ratio</p>"),gaugeOutput("outsiderate"))),

fluidRow( column(width = 6,HTML("<p style='color:darkblue;align: right;font:italic;font-size:20Px'>Vizualization of youth employment in labor force of RWANDA </p>"),plotOutput("employedyouth") ),
          box(title = "",HTML("<p style='color:darkblue;font:italic;font-size:20Px'>the percentage ofyouth employment</p>"),gaugeOutput("eyouth"))),

fluidRow( column(width = 6,HTML("<p style='color:darkblue;align: right;font:italic;font-size:20Px'>Vizualization of youth unemployment in labor force of RWANDA </p>"),plotOutput("unemployedyouth") ),
          box(title = "",HTML("<p style='color:darkblue;font:italic;font-size:20Px'>the percentage of youth unemployment </p>"),gaugeOutput("uyouth"))),

   fluidRow( column(width = 6,HTML("<p style='color:darkblue;align: right;font:italic;font-size:20Px'>the visualization of employment</p>"),plotOutput("employed")),
   box(title = "",HTML("<p style='color:darkblue;font:italic;font-size:20Px'>the percentage of employment rate to the labor force ratio</p>"),gaugeOutput("employedrate")




                              ))),

               tabPanel(title ="economic activities", value = "distro",style = "width: 1300Px;height: 1600Px;background-color: lightgray;",
               numericInput("sector","sector distribution:", value = 50),fluidRow(column(width =12,
          box(title = "",HTML("<p style='color:rose;text_align:center;font:italic;font-size:30Px'>Economic Activities And Income </p>"),imageOutput("activities")))),


       fluidRow( column(width = 6,


                        HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>Economic activities in labor force</p>"),plotOutput("laborpie"),gaugeOutput("industry")),
             box(title = "",HTML("<p style='color:rose;font:italic;font-size:20Px'>the percentage of working per each sector on a hundred</p>"),gaugeOutput("service"),
                                                            gaugeOutput("agri"))),


                 ),



               tabPanel(title ="working age and education status",downloadButton("downloadplot","download visualization",
                  style = "background-color: black;color: yellow;border: none;border-radius: 5Px; padding: 10Px 20Px;"), value = "distro" ,

                     fluidRow( column(width = 6,HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>working age who didn't study</p>"),plotOutput("none") ),
           box(title = "",HTML("<p style='color:rose;font:italic;font-size:20Px'>the percentage of working age who didn't study</p>"),
          gaugeOutput("noneg"))),

       fluidRow( column(width = 6,HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>working age who studied primary only</p>"),plotOutput("pri") ),
             box(title = "",HTML("<p style='color:rose;font:italic;font-size:20Px'>the percentage of working age who completed primary only</p>"),
          gaugeOutput("prig"))),

      fluidRow( column(width = 6,HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>working age who completed lower secondary only</p>"),plotOutput("lower") ),
            box(title = "",HTML("<p style='color:rose;font:italic;font-size:20Px'>the percentage of working age who completed lower secondary only</p>"),
            gaugeOutput("lowerg"))),
       fluidRow( column(width = 6,HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>working age who completed uppersecondary only</p>"),plotOutput("upper") ),
               box(title = "",HTML("<p style='color:rose;font:italic;font-size:20Px'>the percentage of working age who completed upper secondary only</p>"),
                gaugeOutput("upperg"))),
       fluidRow( column(width = 6,HTML("<p style='color:rose;align: right;font:italic;font-size:20Px'>working age who completed university</p>"),plotOutput("university") ),
              box(title = "",HTML("<p style='color:rose;font:italic;font-size:20Px'>the percentage of working age who completed university</p>"),
             gaugeOutput("universityg"))), style = "width: 1300Px;height: 600Px;background-color: lightgray;",

                       )))




     ),


),
)















