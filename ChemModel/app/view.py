from django.shortcuts import render
from django.http import HttpResponse  # モジュールの読み込み
from rdkit import Chem


def hellofunction(request):
    m = Chem.MolFromSmiles('Cc1ccccc1')
    data = len(m.GetAtoms())
    return HttpResponse('RDkitアプリだよ!!!!! 原子数＝{0}'.format(data))