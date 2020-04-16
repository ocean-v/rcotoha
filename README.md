# rcotoha: R for COTOHA API
Wrapper functions for using COTOHA API from R. COTOHA API is [a natural language processing API by NTT Comunnications](https://api.ce-cotoha.com/contents/about-cotoha.html). This API is only for Japanese text.
You can check details on COTOHA API [here](https://api.ce-cotoha.com/contents/index.html).
This is just an interface by a volunteer (not by a company). So you have to register for COTOHA API and you must follow the terms of use by NTT Comunnications.

## Installation
```R
remotes::install_github("ocean-v/rcotoha")
```

## Preparation
You have to check out the information about API on your account home page.

## Usage
### Make configulation files
```R
make_cotoha_config(clientId = "xxxxxx", clientSecret = "xxxxxx", tokenURL = "https://xxxxxx", baseURL = "https://xxxxxx")
```
You will get "config.json" & "endpoint.json" on your current working directory.

### Get access token
```R
get_cotoha_token(config = "config.json", endpoint = "endpoint.json")
```

### Execute COTOHA analysis
Details here -> [https://api.ce-cotoha.com/contents/reference/apireference.html](https://api.ce-cotoha.com/contents/reference/apireference.html)

- Parsing 構文解析（parse）
```R
execute_cotoha_analysis(
       access_token = "Your access token",
       API = "parse",
       sentence = "Your text"
     )
```

- Named entity extraction 固有表現抽出 (ne)
```R
execute_cotoha_analysis(
       access_token = "Your access token",
       API = "ne",
       sentence = "Your text"
     )
```

- Reference Resolution 照応解析（coreference）
```R
execute_cotoha_analysis(
       access_token = "Your access token",
       API = "coreference",
       document = "Your text"
     )
```

- Keyword extraction キーワード抽出（keyword）
```R
execute_cotoha_analysis(
       access_token = "Your access token",
       API = "keyword",
       document = "Your text"
     )
```

- Similarity Calculation 類似度算出（similarity）
```R
execute_cotoha_analysis(
       access_token = "Your access token",
       API = "similarity",
       s1 = "Your text1",
       s2 = "Your text2"
     )
```

- Sentence type classification 文タイプ判定（sentence_type）
```R
execute_cotoha_analysis(
       access_token = "Your access token",
       API = "sentence_type",
       sentence = "Your text"
     )
```

- Sentiment Analysis 感情分析（sentiment）
```R
execute_cotoha_analysis(
       access_token = "Your access token",
       API = "sentence_type",
       sentence = "Your text"
     )
```

- Opptional argument
```R
# example
execute_cotoha_analysis(
       access_token = "Your access token",
       API = "keyword",
       document = "Your text",
       opptional = list(max_keyword_num = 10)
     )
```

### Reshape response into data.frame
Mainly for Named entity extraction 固有表現抽出 & Keyword extraction キーワード抽出.

```R
cotoha_as_df(response = [your response])
```


