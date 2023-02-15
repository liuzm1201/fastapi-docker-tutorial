import jieba


class JiebaTokenizer:
    """结巴分词器"""

    @classmethod
    def cut(cls, text: str, mode: str = 'cut_all'):
        segs = []
        if mode == 'cut_all':  # 全模式
            segs = jieba.cut(text, cut_all=True)
        elif mode == 'accurate':  # 精确模式
            segs = jieba.cut(text, cut_all=False)
        else:  # 搜索引擎模式
            segs = jieba.cut_for_search(text)
        return segs
