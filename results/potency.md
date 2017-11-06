# Analysis of vaccine potency






# Methods

# Results

OBSERVAÇÃO: TRADUÇÕES UTILIZADAS

- bulk mono = bulk
- vacina formulada = final bulk
- vacina liofilizada = final batch

CONFERIR!

![Figure: Potency evaluation of the different vaccine preparations for all three viruses. ](../figures/potency.png)

## Mumps

The linear regression model fit for mumps data indicates that there is a significant decrease in the log quantity (measured in copies/PCR) in both vaccine preparations (final vaccine bulk, and final vaccine batch).
The 


-------------------------------------------------------------
    &nbsp;       Df   Sum Sq   Mean Sq   F value    Pr(>F)   
--------------- ---- -------- --------- --------- -----------
  **Sample**     2    10.42     5.21      307.4    2.808e-16 

 **Residuals**   21   0.3559   0.01695     NA         NA     
-------------------------------------------------------------

Table: ANOVA table for mumps

Residuals appear to be normally distributed (Shapiro-Wilk test, p = 0.67).

## Rubella

The linear regression model fit for rubella data indicates that, compared to the 


-------------------------------------------------------------
    &nbsp;       Df   Sum Sq   Mean Sq   F value    Pr(>F)   
--------------- ---- -------- --------- --------- -----------
  **Sample**     2    7.564     3.782     48.42    1.364e-08 

 **Residuals**   21    1.64    0.07811     NA         NA     
-------------------------------------------------------------

Table: ANOVA table for rubella

Residuals appear to be normally distributed (Shapiro-Wilk test, p = 0.88).

## Measles

The linear regression model fit for measles data indicates that


-------------------------------------------------------------
    &nbsp;       Df   Sum Sq   Mean Sq   F value    Pr(>F)   
--------------- ---- -------- --------- --------- -----------
  **Sample**     2    20.67     10.34      370     4.255e-17 

 **Residuals**   21   0.5866   0.02793     NA         NA     
-------------------------------------------------------------

Table: ANOVA table for Measles

Residuals appear to be normally distributed (Shapiro-Wilk test, p = 0.071).
