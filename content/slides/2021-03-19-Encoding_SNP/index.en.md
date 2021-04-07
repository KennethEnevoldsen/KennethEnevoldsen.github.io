---
title: "Slides: Machine Bias "
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

# Encoding SNP's using CNNs

by Kenneth Enevoldsen | 2021-05-18

---

## Agenda

- What we did
- Convolutional Neural Networks
- Alternative approaches

---

## Denoising Autoencoder

<img src="img/denoising-autoencoder-architecture.png">

---

## Input data
SNP Encoding:

|  0  |  1  |  2  | NA  |
| --- | --- | --- | --- |
|  0  |  0  |  1  |   1|
|  0  |  1  |  1  |   0|

Example data
|     |     |     |     |     |     |     |     |     |     |     |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |--- | --- |
|  0  |  0  |  0  |  1  |  0  |  0  |  0  |  0  |  0  | 0  |  ...  |
|  0  |  1  |  0  |  1  |  0  |  1  |  0  |  1  |  0  |  1  |  ...  | 
|     |     |     |     |     |     |     |     |     |     |     |

---

## Reconstruction

<img src="img/reconstruction.png">

---

## Predicition

<img src="img/encoding_pred.png">

---

## Performance

<img src="img/perf.png" height="700">



---

## 1D Convolutional

<img src="img/stride_2.gif">

- Reduces number of trainable parameters
- Parallel

---

## Activation function

<img src="img/relu.png">


---

## 2D Convolutional

<img src="img/same_padding_no_strides.gif">

---

## Training

<img src="img/backprop.png">

- optimizer: Adam

---

# Alternative Approaches

- Recurrent models
- Positional Encodings
- Attention-based models

---

## Recurrent models

<img src="img/rnn.gif">

---

## Recurrent Encoding

<img src="img/lstm_encoding.png">

---

### Bidirectional

<img src="img/bidirectional.gif">

---

### Positional Encoding

<img src="img/positional.png">

<img src="img/positional_mat.png">

---

### Attention

<img src="img/positional.png">

<img src="img/positional_mat.png">


