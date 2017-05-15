//: Playground - noun: a place where people can play

import Foundation

class Note {
    
    var date: Date?
    var content: String?
    
    init(date: Date?, content: String?) {
        self.date = date
        self.content = content
    }
}

class NoteDAO {
    //保存数据列表
    private var listData = [Note]()
    
    //插入Note方法
    func create(_ model: Note) {
        listData.append(model)
    }
    
    //删除Note方法
    func remove(_ model: Note) throws {
        
        guard let date = model.date else {
            //抛出"主键为空"错误
            throw DAOError.primaryKeyNull
        }
        //比较日期主键是否相等
        for (index, note) in listData.enumerated() where note.date == date {
            listData.remove(at: index)
        }
        
    }
    
    //修改Note方法
    func modify(_ model: Note) throws {
        
        guard let date = model.date else {
            //抛出"主键为空"错误
            throw DAOError.primaryKeyNull
        }
        //比较日期主键是否相等
        for note in listData where note.date == date {
            note.content = model.content
        }
    }
    
    //查询所有数据方法
    func findAll() throws -> [Note] {
        
        guard listData.count > 0 else {
            //抛出"没有数据"错误。
            throw DAOError.noData
        }
        
        defer {
            print("关闭数据库")
        }
        defer {
            print("释放语句对象")
        }
        return listData
    }
    
    //修改Note方法
    func findById(_ model: Note) throws -> Note? {
        
        guard let date = model.date else {
            //抛出"主键为空"错误
            throw DAOError.primaryKeyNull
        }
        //比较日期主键是否相等
        for note in listData where note.date == date {
            return note
        }
        return nil
    }
    
}


//自定义错误类型
enum DAOError: Error {
    case noData
    case primaryKeyNull
}

//日期格式对象
var dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

let dao = NoteDAO()

//查询所有数据
do {
    try dao.findAll()
} catch DAOError.noData {
    print("没有数据。")
    
    //准备要插入的数据
    var date1 = dateFormatter.date(from: "2017-01-01 16:01:03")!
    var note1 = Note(date:date1, content: "Welcome to MyNote.")
    var date2 = dateFormatter.date(from: "2017-01-02 8:01:03")!
    var note2 = Note(date:date2, content: "欢迎使用MyNote。")
    //插入数据
    dao.create(note1)
    dao.create(note2)
}


do {
    var note = Note(date:nil, content: "Welcome to MyNote.")
    try dao.remove(note)
} catch DAOError.primaryKeyNull {
    print("主键为空。")
}

func printNotes() throws {
    
    let datas  = try dao.findAll()
    for note in datas {
        print("date : \(note.date!) - content: \(note.content!)")
    }
}

try printNotes()



