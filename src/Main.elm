module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes
import Time



-- View


view : () -> Browser.Document msg
view () =
    { title = "CV"
    , body =
        [ header
        , educationView
        , workExperienceView
        , projectsView
        , Html.footer []
            [ Html.p []
                [ Html.text <| text.email ++ "(", emailLink, Html.text ")." ]
            ]
        ]
    }


emailLink : Html msg
emailLink =
    Html.a [ Html.Attributes.href <| "mailto:" ++ text.emailAddress ]
        [ Html.text text.emailAddress ]



-- Header


header : Html msg
header =
    Html.header []
        [ Html.h1 [] [ Html.text text.myName ]
        , Html.hr [] []
        , Html.h3 [] [ Html.text "SKILLS" ]
        , Html.p [] [ Html.text (text.skillsList |> String.join ", ") ]
        , Html.p [] [ Html.text text.skillsDescription ]
        ]



-- Education view


educationView : Html msg
educationView =
    Html.section []
        [ Html.h2 [] [ Html.text "Education" ]
        , Html.div [ Html.Attributes.class "experience-cards" ]
            [ experienceCard talTechEducationExperience
            , experienceCard maritimeAcademyEducationExperience
            , experienceCard kuressaareGymnasiumEducationExperience
            ]
        , Html.p [] [ Html.text text.additionalEducationInfo ]
        ]



-- WorkExperience view


workExperienceView : Html msg
workExperienceView =
    Html.section []
        [ Html.h2 [] [ Html.text "Experience" ]
        , Html.div [ Html.Attributes.class "experience-cards" ]
            [ experienceCard tallinkWorkExperience
            , experienceCard talTechPythonWorkExperience
            , experienceCard transferWiseWorkExperience
            , experienceCard talTechJavaWorkExperience
            ]
        , Html.p [] [ Html.text text.additionalTalTechWorkInfo ]
        , Html.p [] [ Html.text text.additionalTransferwiseWorkInfo ]
        , Html.p [] [ Html.text text.additionalTallinkWorkInfo ]
        ]



-- Projects view


projectsView : Html msg
projectsView =
    Html.section []
        [ Html.h2 [] [ Html.text "Projects" ]
        , Html.p []
            [ Html.text "You can check out my github at "
            , Html.a [ Html.Attributes.href "https://github.com/WhileTruu" ]
                [ Html.text "https://github.com/WhileTruu" ]
            , Html.text "."
            , Html.p []
                [ Html.text "A few projects I have outlined below."
                ]
            ]

        -- Salmefelt
        , Html.h3 [] [ Html.text "Salmefelt" ]
        , Html.a
            [ Html.Attributes.href "https://www.salmefelt.com" ]
            [ Html.text "https://www.salmefelt.com" ]
        , Html.text ", "
        , Html.a
            [ Html.Attributes.href "https://github.com/WhileTruu/salmefelt" ]
            [ Html.text "https://github.com/WhileTruu/salmefelt" ]
        , Html.p [] [ Html.text text.salmefelt ]

        -- Peers Against Humanity
        , Html.h3 [] [ Html.text "Peers Against Humanity" ]
        , Html.a
            [ Html.Attributes.href "https://github.com/WhileTruu/peers-against-humanity-frontend" ]
            [ Html.text "https://github.com/WhileTruu/peers-against-humanity-frontend" ]
        , Html.text ", "
        , Html.a
            [ Html.Attributes.href "https://github.com/WhileTruu/peers-against-humanity-backend" ]
            [ Html.text "https://github.com/WhileTruu/peers-against-humanity-backend" ]
        , Html.p [] [ Html.text text.peersAgainstHumanity ]

        -- This project
        , Html.h3 [] [ Html.text "CV" ]
        , Html.a
            [ Html.Attributes.href "https://github.com/WhileTruu/cv" ]
            [ Html.text "https://github.com/WhileTruu/cv" ]
        , Html.p [] [ Html.text "This very page is also a tiny elm app. :)" ]
        ]



-- ExperienceCard view


createDateRangeText :
    { year : Int, month : Time.Month }
    -> Maybe { year : Int, month : Time.Month }
    -> String
createDateRangeText from maybeTo =
    let
        monthAndYearToString : { year : Int, month : Time.Month } -> String
        monthAndYearToString { year, month } =
            monthToString month ++ " " ++ String.fromInt year
    in
    ("From " ++ monthAndYearToString from ++ " to ")
        ++ (maybeTo |> Maybe.map monthAndYearToString |> Maybe.withDefault "present")


type alias Experience msg =
    { attributes : List (Html.Attribute msg)
    , location : String
    , speciality : String
    , from : { year : Int, month : Time.Month }
    , maybeTo : Maybe { year : Int, month : Time.Month }
    }


experienceCard : Experience msg -> Html msg
experienceCard { attributes, location, speciality, from, maybeTo } =
    Html.div
        ([ Html.Attributes.class "experience-card" ] ++ attributes)
        [ Html.h3 [] [ Html.text location ]
        , Html.h4 [] [ Html.text speciality ]
        , Html.p [] [ Html.text <| createDateRangeText from maybeTo ]
        ]



-- Utilities


monthToString : Time.Month -> String
monthToString month =
    case month of
        Time.Jan ->
            "January"

        Time.Feb ->
            "February"

        Time.Mar ->
            "March"

        Time.Apr ->
            "April"

        Time.May ->
            "May"

        Time.Jun ->
            "June"

        Time.Jul ->
            "July"

        Time.Aug ->
            "August"

        Time.Sep ->
            "September"

        Time.Oct ->
            "October"

        Time.Nov ->
            "November"

        Time.Dec ->
            "December"



-- Experiences


talTechEducationExperience : Experience msg
talTechEducationExperience =
    { attributes = [ Html.Attributes.class "experience-card--tal-tech light-color" ]
    , location = "Tallinn University of Technology"
    , speciality = "Informatics"
    , from = { year = 2014, month = Time.Sep }
    , maybeTo = Just { year = 2017, month = Time.Jun }
    }


maritimeAcademyEducationExperience : Experience msg
maritimeAcademyEducationExperience =
    { attributes = [ Html.Attributes.class "experience-card--maritime-academy" ]
    , location = "Estonian Maritime Academy"
    , speciality = "Navigation Officer"
    , from = { year = 2011, month = Time.Sep }
    , maybeTo = Just { year = 2014, month = Time.Feb }
    }


kuressaareGymnasiumEducationExperience : Experience msg
kuressaareGymnasiumEducationExperience =
    { attributes = [ Html.Attributes.class "experience-card--kuressaare-gymnasium light-color" ]
    , location = "Kuressaare Gymnasium"
    , speciality = "Secondary Education"
    , from = { year = 2008, month = Time.Sep }
    , maybeTo = Just { year = 2011, month = Time.Jun }
    }


talTechJavaWorkExperience : Experience msg
talTechJavaWorkExperience =
    { attributes = [ Html.Attributes.class "experience-card--tal-tech light-color" ]
    , location = "Tallinn University of Technology"
    , speciality = "Teacher's assistant: Main Course of Programming in Java"
    , from = { year = 2016, month = Time.Feb }
    , maybeTo = Just { year = 2016, month = Time.Jun }
    }


talTechPythonWorkExperience : Experience msg
talTechPythonWorkExperience =
    { attributes = [ Html.Attributes.class "experience-card--tal-tech light-color" ]
    , location = "Tallinn University of Technology"
    , speciality = "Teacher’s assistant: Programming in Python for advanced students"
    , from = { year = 2016, month = Time.Sep }
    , maybeTo = Just { year = 2017, month = Time.Jan }
    }


transferWiseWorkExperience : Experience msg
transferWiseWorkExperience =
    { attributes = [ Html.Attributes.class "experience-card--transferwise light-color" ]
    , location = "TransferWise"
    , speciality = "Internship Bootcamp"
    , from = { year = 2016, month = Time.Jul }
    , maybeTo = Just { year = 2016, month = Time.Aug }
    }


tallinkWorkExperience : Experience msg
tallinkWorkExperience =
    { attributes = [ Html.Attributes.class "experience-card--tallink" ]
    , location = "Tallink"
    , speciality = "Frontend developer"
    , from = { year = 2017, month = Time.Nov }
    , maybeTo = Nothing
    }



-- Text


text =
    { myName = "Marten Truu"
    , email =
        """
        I can be contacted by email
        """
    , emailAddress = "marten.truu@gmail.com"
    , skillsList =
        [ "JavaScript"
        , "Elm"
        , "React"
        , "AngularJS"
        , "Docker"
        , "Python"
        , "Java"
        , "SQL"
        , "Linux"
        , "Unix"
        ]
    , skillsDescription =
        """
        I like learning new things, finding the root cause and the right
        solution to problems, cooking, hiking, working out and gaming, I also
        enjoy working with vector graphics (Inkscape, Sketch).
        """
    , additionalEducationInfo =
        """
        In July 2018, my team and I at Tallink went to the Elm Europe conference
        to discuss the approaches we have chosen in developing our app and to
        find out what others have done differently and how that has worked out
        for them.
        """
    , additionalTalTechWorkInfo =
        """
        As a teacher’s assistant in Tallinn University of Technology I
        created exercises for students to solve, helped them with their problems
        and assignments and evaluated their homework.
        """
    , additionalTransferwiseWorkInfo =
        """
        At the internship bootcamp at TransferWise I was in a team dealing with
        help experience, there I took part in the development of a context aware
        frequently asked questions component, messaging systems and internal
        tools.
        """
    , additionalTallinkWorkInfo =
        """
        At Tallink I develop our mobile booking application (AngularJS, Elm) and
        previously worked on mobile on-route information and reservation change
        applications (React, some Clojure). Here I have acquired great
        experience in slowly migrating a large application from an
        unmaintainable combination of many many different technologies
        (CoffeeScript, TypeScript, Redux, AngularJS, Kefir.js, etc.) to Elm, a
        language we chose with the team, while also developing new features. I
        also have some basic Kubernetes skills from here (setting up Gitea).
        """
    , salmefelt =
        """
        This simple single page application showcases different felted products,
        which can be dynamically changed. The frontend is written in Elm, the
        backend uses Python, Django, Docker and the is served by Nginx.
        """
    , peersAgainstHumanity =
        """
        A cards against humanity web app, created as part of my bachelor’s
        thesis. Nothing too fancy except for using a full mesh peer-to-peer
        network for all in-game communications.
        """
    }



-- Main


main : Platform.Program () () msg
main =
    Browser.document
        { init = \() -> ( (), Cmd.none )
        , view = view
        , update = \_ -> \() -> ( (), Cmd.none )
        , subscriptions = \_ -> Sub.none
        }
