# Automated LaTeX Reference Checker for PRL Submissions

A bash script that scans the main LaTeX .tex file and Supplementary Material (SM) files to identify references in the SM not cited in the main text. Outputs a list of these references for inclusion in the SM \bibitem. Streamlines the preparation process for PRL submissions.

## Why it exists

Physical Review Letters require to refer to your Supplementary Material as a citation. For this perpose the following bib-item is usually created:
```latex
@misc{SM,
    title = {{See Supplemental Material at \textit{[URL will be inserted by publisher]}
    for the ... (describe all the main sections in SM), which includes Refs~\cite{}
    }}
}
```
Where you need to provide a description of all the main sections in the SM and a ***list of all references that are in the SM but not in the main text***. In the main text, refer to the SM as a citation using `\cite{SM}`.

If there are many references, this can be quite labor-intensive. Using regular expressions, you can write a bash script to automate this process.

## Usage 
```
bash script.sh main.tex sm.tex
```
then open `extra_keys_in_sm` or `extra_keys_in_sm_oneline` to see all the extra bib items you need to include in your SM description.


