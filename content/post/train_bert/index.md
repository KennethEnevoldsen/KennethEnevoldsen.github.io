---
authors:
- admin
- Lasse Hansen
- Malte Bertelsen
links:
- icon: github
  icon_pack: fab
  name: Code
  url: https://github.com/KennethEnevoldsen/tutorial_fine-tuning_danish_bert

date: "2021-02-12T00:00:00Z"
draft: false
featured: false
image:
  caption: 'Credit: BotXO'
  focal_point: ""
  placement: 2
  preview_only: false
lastmod: "2021-02-12T00:00:00Z"
projects:

summary: "An easy straightforward tutorial for fine-tuning a Danish BERT using simpletransformers"
tags:
- NLP

title: Fine-Tuning a Danish BERT
---

# Fine-tuning a Danish BERT

This tutorial will take you through how to fine-tune a BERT, both for sentence and token classification. 

Start by installing the requirements by running the following chunk:






```python
!pip install -r requirements.txt
```

### Importing packages


```python
# native packages
import os

# widely use packages
import pandas as pd

# other packages
from simpletransformers.ner import NERModel
from simpletransformers.classification import ClassificationModel

from danlp.datasets import DDT
import pyconll
```

---

## Token Classification
Let's start by doing a token classification. Token classification is the act of classifying tokens as is for example used to classify whether a token is an entity and what type of entity it is, e.g. person, organization or location. This is typically called named-entity recognition. Other token classification tasks include part-of-speech tagging as well as others. For this example we will train a BERT for named-entity recognition using the tagged data by DaNLP derived from the Danish dependency Treebank. We will start by loading in the data and examining it.


```python
# Loading the Danish Dependency Tree data
ddt = DDT()
conllu_format = ddt.load_as_conllu(predefined_splits = True)

data = []
for n in range(len(conllu_format)):
    data.append([(i, token.form, token.misc.get("name").pop()) for i, sent in enumerate(conllu_format[n]) for token in sent]) #Getting the sentence #, Word and Tag.
```


```python
# this dataset contain a training dataset
train = pd.DataFrame(data[0], columns = ['sentence_id', 'words', 'labels']) # note that the names of the columns are important for the model
# a development test dataset
test = pd.DataFrame(data[1], columns = ['sentence_id', 'words', 'labels'])
# and lastly a validation dataset
validation = pd.DataFrame(data[2], columns = ['sentence_id', 'words', 'labels'])

# examing the first ten rows we see some of the structure of the data
train.head(10)
```

Okay so now we are ready to train the model. Beware that this process might take some time to it might be ideal to only use some of the data.


```python
# get list of unique labels
unique_labels = list(train['labels'].unique())

# we will need to rename the config file from bert_config.json to config.json
# os.rename('danish_bert_uncased_v2/bert_config.json', 'danish_bert_uncased_v2/config.json')

# preparing the model
model = NERModel('bert', model_name = 'Maltehb/danish-bert-botxo', labels=unique_labels, use_cuda=False, args={'overwrite_output_dir': True, 'reprocess_input_data': True})
```


```python
# Training the model
model.train_model(train)
```

## Sentence Classification
Sentence classification is the act of classifying a sentence. This could be classyfying the topic of a sentence or classifying whether a sentence is postive or negative. In this case we will try to predict the score of a trustpilot review based on the text of the review. The dataset used for this is avaliable in the [Github repository](https://github.com/KennethEnevoldsen/tutorial_fine-tuning_danish_bert). 



```python
tp = pd.read_csv("trustpilot.csv")
tp.columns = ['text', 'labels'] # rename variables - not that the renames variable names are important

tp['text'] = tp['text'].astype('str')
tp['labels'] = tp['labels'] - 1 # index to zero
tp.head(10)
```


```python
# number og unique labels
n_labels = len(tp['labels'].unique())

# initialize the model
sent_model = ClassificationModel('bert', 'Maltehb/danish-bert-botxo', num_labels=n_labels, use_cuda=False, args={'reprocess_input_data': True, 'overwrite_output_dir': True})
```


```python
# train the model
sent_model.train_model(tp)
```

## Conclusion
And that is it! You have now fine-tuned two Danish BERT models for token and sentence classification!🥳 

To use the model simply use `model.predict()`.

This tutorial was made by [L. Hansen](https://github.com/HLasse), [M. Højmark-Bertelsen](https://github.com/MalteHB) and [K. Enevoldsen](https://github.com/KennethEnevoldsen). Feel free to ask any question in the GitHub issues.

