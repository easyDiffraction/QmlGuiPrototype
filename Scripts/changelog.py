#!/usr/bin/env python3

from functions import * 

# ChangelogArticle
class ChangelogArticle:
    __slots__ = ['version', 'date', 'list']

    def __init__(self, version='', date='', list=[]):
        self.version = version
        self.date = date
        self.list = list

# Changelog
class Changelog:
    def __init__(self, title=''):
        #self.app = 'Davinci'
        self.title = title
        self.last_article = ChangelogArticle()
        self.all_articles = []
        self.idx = 0
        self.add_articles()

    def __iter__(self):
        return self

    def __next__(self):
        self.idx += 1
        try:
            return self.all_articles[self.idx-1]
        except IndexError:
            self.idx = 0
            raise StopIteration

    def __getitem__(self, idx):
        return self.all_articles[idx]

    def version(self):
        return self.last_article.version

    def date(self):
        return self.last_article.date
        #return ConvertDate(self.last_article.date, '%Y-%m-%d', '%d %b %Y')

    def add(self, version, date, list):
        date = ConvertDate(date, '%Y-%m-%d', '%d %b %Y')
        self.last_article = ChangelogArticle(version, date, list)
        self.all_articles.insert(0, self.last_article)
        #self.all_articles.append(self.last_article)

    def add_articles(self):

        self.add(version="1.0.0",
                 date="2019-06-04",
                 list=[ 'First release' ])
