% Set font size and paper type
\LoadClass[11pt,letterpaper]{article}

% Enable custom colors
\RequirePackage[usenames,dvipsnames]{xcolor}

% Remove paragraph indentation
\usepackage[parfill]{parskip}

% Enable boldface for tabular columns
\usepackage{array}

% Enable if-then-else statements
\usepackage{ifthen}

% Suppress page numbers
\pagestyle{empty}

% Create a custom bullet point symbol
\usepackage{scalerel}
\usepackage{bbding,pifont}

%----------------------------------------------------------------------------------------
% Define navy blue color for section headings and lines
%----------------------------------------------------------------------------------------
\definecolor{navyblue}{RGB}{0,54,123}

%----------------------------------------------------------------------------------------
% Define custom bullet point symbol with scalable size
%----------------------------------------------------------------------------------------
\newcommand\sbullet[1][.5]{ % Command with optional argument for scaling factor (default 0.5)
    \mathbin{ % Create a binary math operator to ensure proper spacing
        \ThisStyle{ % Preserve the current math style
            \vcenter{ % Vertically center the content
                \hbox{ % Create a horizontal box for the content
                    \scalebox{#1}{ % Scale the content by the specified scaling factor
                        $\SavedStyle\bullet$ % Preserve the current math style and insert a bullet symbol
                    }
                }
            }
        }
    }
}

%----------------------------------------------------------------------------------------
% Define name command for storing user's name
%----------------------------------------------------------------------------------------
\def \name#1{\def\@name{#1}}
\def \@name {}

%----------------------------------------------------------------------------------------
% Define printname command for printing the user's name
%----------------------------------------------------------------------------------------
\newcommand{\printname}{
    \begingroup % Begin a group to localize settings
        \hfil % Create horizontal fill to center the content
        {\namesize\bfseries\textit{\@name}} % Set the name size, bold, and italic style
        \hfil % Create horizontal fill to center the content
        \vspace{0.5cm} % Add vertical space below the name
    \endgroup % End the group to revert localized settings
}

%----------------------------------------------------------------------------------------
% Define tag command for formatting tags
%----------------------------------------------------------------------------------------
\newcommand{\tag}[1]{\textcolor{navyblue}{\textit{#1: }}}

%----------------------------------------------------------------------------------------
% Define info command for formatting information text
%----------------------------------------------------------------------------------------
\newcommand{\info}[1]{\textcolor{black}{#1}}

%----------------------------------------------------------------------------------------
% Define personalInfo command for formatting personal information
%----------------------------------------------------------------------------------------
\newcommand{\personalInfo}[1]{\centerline{#1}\par\personalInfoSkip}

%----------------------------------------------------------------------------------------
% Define infoSeparator command for formatting separators in personal information
%----------------------------------------------------------------------------------------
\newcommand{\infoSeparator}{{\textcolor{navyblue}{\ding{92}\hspace{0.1 cm}}}}


%----------------------------------------------------------------------------------------
% Define printPersonalInfo command for printing personal information
%----------------------------------------------------------------------------------------
\newcommand{\printPersonalInfo}[1]{ % Command with one required argument for personal information
    \begin{center} % Begin center environment to center the content
        #1 % Print the personal information content
    \end{center} % End center environment
    \vspace{-1cm} % Add negative vertical space to reduce the gap below the personal information
}

%----------------------------------------------------------------------------------------
% Replace the document command with custom implementation
%----------------------------------------------------------------------------------------
\let\ori@document=\document % Save the original \document command as \ori@document
\renewcommand{\document}{ % Redefine the \document command
    \ori@document % Call the original \document command
    \begin{center} % Begin center environment to center the content
        \printname % Print the user's name using the \printname command
    \end{center} % End center environment
}

%----------------------------------------------------------------------------------------
% Define rSection environment for formatting sections
%----------------------------------------------------------------------------------------
\newenvironment{rSection}[1]{ % 1 input argument - section name
    \sectionskip % Space before section
    {\color{navyblue}{\bf \textit{#1}}} % Navy blue, bold, italic section title
    \sectionlineskip % Space before horizontal line
    {\color{navyblue}\hrule} % Navy blue horizontal line
    \begin{list}{}{ % Begin a list environment
        \setlength{\leftmargin}{1.5em} % Set the left margin for the list
    }
    \item[] % Start an item with no label
}{
    \end{list} % End the list environment
}

%----------------------------------------------------------------------------------------
% Define rSubsectionNoBullet environment for formatting education and work experience without bullet points
%----------------------------------------------------------------------------------------
\newenvironment{rSubsectionNoBullet}[4]{ % 4 input arguments - company name, year(s) employed, job title, and location
    {\bf #1} \hfill {\textit{#2}} \newline % Bold company name and italic date on the right
    \ifthenelse{\equal{#3}{}}{}{ % Check if job title is empty
        {\textit{#3}}% Italic job title
        \ifthenelse{\equal{#4}{}}{}{ % Check if location is empty
            \hfill {\textit{#4}} % Italic location
        }
    }
    \begin{list}{}{ % Begin a list environment
        \leftmargin=0em \itemindent=0em \labelwidth=0em \labelsep=0em % No bullets and no indentation
    }
    \itemsep -0.7em \vspace{-0.7em} % Compress space between list items
}{
    \end{list} % End the list environment
}

%----------------------------------------------------------------------------------------
% Define rSubsection environment for formatting education and work experience with bullet points
%----------------------------------------------------------------------------------------
\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title, and location
    {\bf #1} \hfill {\textit{#2}} \newline % Bold company name and italic date on the right
    \ifthenelse{\equal{#3}{}}{}{ % Check if job title is empty
        {\textit{#3}} \hfill {\textit{#4}} % Italic job title and location
    }
    \smallskip % Small space before bullet list
    \begin{list}{$\sbullet[.65]$}{ % Begin a list environment with custom bullet symbol
        \leftmargin=2em % Set left margin for list
    }
    \itemsep -0.5em \vspace{-0.5em} % Compress space between list items
}{
    \end{list} % End the list environment
    \vspace{0.5em} % Space after bullet list
}

%----------------------------------------------------------------------------------------
% Define spacings after certain elements in the document
%----------------------------------------------------------------------------------------
\def\namesize{\huge} % Size of the name at the top of the document
\def\personalInfoSkip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section
\def\sectionskip{\medskip} % The space after the heading section