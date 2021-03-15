---
title: ml_bias
author: admin
date: '2021-03-15'
slug: ml-bias
categories: []
tags:
  - Bias
  - Mathematics
  - Fairness
subtitle: ''
summary: ''
authors: []
lastmod: '2021-03-15T09:13:15+01:00'
featured: no
image:
  caption: ''
  focal_point: ''
  preview_only: no
projects: []
slides:
  theme: white
  highlight_style: "github"
---

# Machine Bias and Probublica

by Kenneth Enevoldsen | 2021-05-15

---

## A Brief introduction
Propublica and COMPAS


<img src="img/propublica.png">

{{< speaker_note >}}
- Press `S` key to view
- PB, article ("Bias in errors") ->
- response from northpoint ("statistical parity") ->
- research ("both are not possible")
{{< /speaker_note >}}

---

## Three fairness conditions

{{% fragment %}} Well-calibrated, statistical parity {{% /fragment %}}

{{% fragment %}} Balance for the positive class {{% /fragment %}}

{{% fragment %}} Balance for the negative class {{% /fragment %}}

---

## Statistical parity

A person in group $a$ and a person in group $b$ should have equal probability to be assigned to either class positive or negative class.

$$
P(R = + | A=a) = P(R = + | A = b) \quad \forall a, b\in A
$$

Where $R$ is the predicted response variable.

---

## Balance for positive class

The average score received by a positive case (unknown to the model) should be the same in each group. 

$$
E(S |Y=+, A=a) = E(S |Y=+, A=b) \quad \forall a, b\in A
$$

Where $S$ is the probability score, $Y$ is the actual response variable.

---


## Balance for negative class

Similar to before:

$$
E(S |Y=-, A=a) = E(S |Y=-, A=b) \quad \forall a, b\in A
$$

Where $S$ is the probability score, $Y$ is the actual response variable.

---

## Theorem 1.1

*"Consider an instance of the problem in which there is a risk assignment satisfying the [three fairness conditions]. Then the instance must either allow for perfect prediction [...] or have equal base rates."*

---

## Theorem 1.2

The approximate version of 1.1.

approximately fair $\Rightarrow$ approximately perfect prediction or approximately equal base rate

---


## Picking our poison 🦠🧪

One of the following must hold:

{{% fragment %}} the test’s probability estimates are systematically skewed upward or downward for at least one gender {{% /fragment %}}

{{% fragment %}} the test assigns a higher average risk estimate to healthy people, in one gender than the other {{% /fragment %}}

{{% fragment %}} the test assigns a higher average risk estimate to carriers of the disease in one gender than the other {{% /fragment %}}


---

# References
- Kleinberg, J., Mullainathan, S., & Raghavan, M. (2016). Inherent Trade-Offs in the Fair Determination of Risk Scores. ArXiv:1609.05807 [Cs, Stat]. http://arxiv.org/abs/1609.05807
- Mattu, J. A., Jeff Larson,Lauren Kirchner,Surya. (2016). Machine Bias. ProPublica. Retrieved March 14, 2021, from https://www.propublica.org/article/machine-bias-risk-assessments-in-criminal-sentencing

