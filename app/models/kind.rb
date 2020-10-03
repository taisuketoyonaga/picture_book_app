class Kind < ActiveHash::Base
  self.data = [
    { id: 1, name: '虫' },
    { id: 2, name: '動物' },
    { id: 3, name: '鳥' },
    { id: 4, name: 'は虫類' },
    { id: 5, name: '両生類' },
    { id: 6, name: '魚' },
    { id: 7, name: 'その他' },
    { id: 8, name: 'わからない' }
  ]
end
