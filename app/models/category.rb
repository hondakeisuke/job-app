class Category <  ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '土木一式工事' },
    { id: 2, name: '建築一式工事 ' },
    { id: 3, name: 'とび・大工工事業' },
    { id: 4, name: '鉄筋工事業' },
    { id: 5, name: '塗装工事業' },
    { id: 6, name: '石工事業' },
    { id: 7, name: '屋根工事業' },
    { id: 8, name: '電気・通信工事業' },
    { id: 9, name: '管事業' },
    { id: 10, name: '防水工事業' },
    { id: 11, name: '内装仕上工事業' },
    { id: 12, name: '熱絶縁工事業' },
    { id: 13, name: '造園工事業' },
    { id: 14, name: '解体工事業' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :jobs
end
