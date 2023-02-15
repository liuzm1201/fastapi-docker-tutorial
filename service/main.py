from fastapi import FastAPI
from pydantic import BaseModel

from tokenizer.model import JiebaTokenizer


app = FastAPI(title='jieba-tokenizer-service', version='v0.0.1')


class Query(BaseModel):
    text: str
    mode: str = 'cut_all'


@app.post('/api/v1/tokenization')
def get_tokenization(query: Query):
    segs = JiebaTokenizer.cut(query.text, query.mode)
    return {'segs': segs}
