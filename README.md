# Test-driven development workshop for ecology and evolution

Welcome to this small tutorial on how to implement unit tests in your code! This workshop is tailored to ecologists and evolutionary biologists, and was designed for the 2026 [SORTEE](https://sortee.org) conference, with the hope of popularizing this set of good programming practices among scientists who do not necessarily have a computer science of software development background.

The workshop consists of a presentation (slides available in this repository) and a practical. The practical is done in [R](https://r-project.org) (Python version soon-to-be available) and consists of a series of exercises requiring tweaking some code that is made available to the attendees in this repo. The presentation should ideally have been followed before attempting the practical.

## Prerequisites

For this practical you would need:

* R (4.3.3+)

As well as the CRAN packages:

* [testthat](https://testthat.r-lib.org/) (3.3.2+)
* [covr](https://covr.r-lib.org/) (3.6.4+)

Optionally, [RStudio](https://posit.co/products/open-source/rstudio) (2024.12.1+) would be very helpful.

## Practical

Welcome to the practical!

Please download the repository onto your computer. I have provided for you a series of compressed folders, each of which containing scripts to be used throughout the practical. For each exercise, you are supposed to play with and tweak the scripts contained in the corresponding folders, until you reach satisfying code. The folders are to be used in order defined by their numbering - don't worry, I will tell you when to move on to the next folder. Just know that the folders look very similar and basically represent the increase in complexity of a single code base as you go through the questions.

The structure of one such folder looks like:

* a folder with R functions stored
* a script where a series of tests of said functions have been prepared
* some numbered R scripts that call the functions and the tests
* an RStudio project on which you can click to directly open a session within the right working directory (I recommend you do that)

The practical goes through a series of steps to build some reusable code as part of a fictional population genetics small project. The modus operandi is as follows: you have code written, which may contain bugs, and you need to write and run unit tests to figure out where the bugs are and fix them. Each step of the way, we add tests and tweak the code, with two aims in mind: all tests passing, and 100% code coverage.

Good luck!

## Instructions

[FOLDER: tdd-workshop-1]

1. You've inherited a bunch of code from a collaborator with whom you want to create a simple toolbox for population genetics. The collaborator tells you that the code was in fact written by their student, for the purpose of a Master's thesis, which was duly completed, with beautiful figures and all. The collaborator even checked that all the code runs without returning an error. You pass the code down to your own student, who is writing a simulation that requires all these pop-gen tools. But your student gets back to you saying that one function in particular, the one calculating the inbreeding coefficient from a series of genotypes, produces weird results. You pass the code on to your department's scientific programmer, who returns it to you with a bunch of tests written in a separate script. They say that some tests are failing, so there must be a bug (or more?) in the code. We have provided you with the function and the tests in the accompanying code. Run the tests sent to you by the programmer, and see for yourself. Figure out which tests fail, and see if that helps you find the bug(s) and fix it (them). Keep at it until all the tests pass. 

|-|

Box 1. Inbreeding coefficient.

|-|

In population genetics, the inbreeding coefficient (Fis) of a population at a given locus (or gene) is the reduction in heterozygosity at that locus which could be attributed to non-random mating within that group or population. It is commonly calculated as:

Fis = (He - Ho) / He

where He is the heterozygosity expected under random mating, and Ho is the observed heterozygosity (i.e. the actual proportion of heterozygotes). The expected heterozygosity He is itself calculated from the frequencies of the different alleles in the population:

He = 1 - p^2 - q^2 - ... (in a diploid population)

where p, q, ..., are the frequencies of each allele (e.g. p = f(A), q = f(a), ...).

The inbreeding coefficient ranges between -1 and 1. The logic behind it is that the more inbreeding, i.e. the more individuals mate with related individuals with similar genetic makeup, the more homozygotes will be produced and the lower the number of heterozygotes in the population (so the higher the coefficient). Zero represents the null expectation under random mating. Basically, inbreeding erodes genetic diversity, and the inbreeding coefficient is a way to measure that.

|-|

[FOLDER: tdd-workshop-2]

[Answer](answers/answer_1.txt)

[FOLDER: tdd-workshop-3]

2. Whoops, you receive an email from the programmer who tells you that they forgot to test the edge situation in which the entire population consists of a single homozygote genotype (a maximally inbred population). They send you the missing tests, which we have added to the code base. Do these new tests pass? If not, what's going on? And can you fix it?

[FOLDER: tdd-workshop-4]

[Answer](answers/answer_2.txt)

3. Now that the bugs are fixed and all the tests pass, it is time to check code coverage, for good measure. We provide you with a script to do that. If the code is fully tested, code coverage should be 100%. Is it? If not, try to figure which lines of code have not been tested. Write tests to cover all edge cases and bring code coverage to no less than 100%. Do all of the added tests pass? If not, which one breaks? Can you figure out why and fix any issue there might be?

[FOLDER: tdd-workshop-5]

[Answer](answers/answer_3.txt)

[FOLDER: tdd-workshop-6]

4. Having a function that calculates the inbreeding coefficient is great, but a toolbox with just one tool is not exactly groundbreaking. You decide to add to it a function to compute the fixation index, or Fst statistic, from two vectors of genotypes. Try to build your new function using the test-driven development philosophy: write test, test fails, update code, test passes, repeat. Make sure that your function computes the statistic correctly, handles edges cases and errors appropriately, and that all lines of code are tested. For this question, we have prepared skeleton code for you to complete. To help you and avoid code repetition, we have outsourced the initial checks (those performed in the preamble of the inbreeding coefficient function) to a separate function, which is then reused in the preamble of the fixation index function. This now means that the checking function can be tested on its own, separately from its occurrence within the inbreeding coefficient function or the fixation index function. Move the tests around accordingly, still striving for 100% code coverage and all tests passing.

|-|

Box 2. Fixation index.

|-|

The fixation index (Fst) is a popular measure of the genetic differentiation between two populations at a given locus. It is calculated as a proportion of heterozygotes across two populations taken separately, compared against the null expectation in which both populations are actually one and the same, randomly mixing population. One formula for Fst is:

Fst = (Ht - Hs) / Ht

where Ht is the total heterozygosity that would be expected if both populations were one and the same, and Hs is the average heterozygosity expected across both populations taken separately. In turn, total heterozygosity is computed as:

Ht = 1 - p^2 - q^2 - ... (in a diploid population)

where p, q, ..., are the frequencies of each allele pooled across both populations. In contrast, the average within-population heterozygosity is given as:

Hs = (Hs1 + Hs2) / 2

where 

Hsi = 1 - pi^2 - qi^2 - ... (in a diploid population)

where pi, qi, ..., are the frequencies of each allele within each population i.

The fixation index ranges between -1 and 1. The higher its value, the more the two populations are genetically differentiated, i.e. they each contain an excess of a different allele at the focal locus, such that it looks like the two populations are indeed separate, with their own allele frequencies. A value of zero is expected under the null scenario of no difference in allele frequencies. 

|-|

[FOLDER: tdd-workshop-7]

[Answer](answers/answer_4.txt)

[FOLDER: tdd-workshop-8]

5. You realize that you have not covered one edge case: that of empty genotypes (e.g. "" instead of "Aa"). You add a line of code in the input checks to make sure that empty genotypes trigger an error, and you add a corresponding new test. (We've added these bits to the code base.) Do the tests pass? What about code coverage? What's going on here? Can you fix it? Hint: why are we only checking that the first genotype is empty, and not all genotypes?

[FOLDER: tdd-workshop-9]

[Answer](answers/answer_5.txt)

## Links

* [tdd-workshop](https://github.com/rscherrer/tdd-workshop)

## Permissions

Copyright (c) Raphaël Scherrer, 2026.

The code in this repository is shared under the [MIT license](LICENSE.txt) license. The creative content (e.g. slides) is shared under the [CC-BY 4.0](LICENSE_DATA.txt) license. 