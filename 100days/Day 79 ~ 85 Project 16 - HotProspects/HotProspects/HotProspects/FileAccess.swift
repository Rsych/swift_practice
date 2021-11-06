//
//  FileAccess.swift
//  HotProspects
//
//  Created by Ryan J. W. Kim on 2021/11/06.
//

import Foundation

private func filePath(filename: String) -> URL {
    let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let url = path.appendingPathComponent(filename)
    return url
}

private func jsonDecode(_ data: Data) -> [Prospect]? {
    let decoder = JSONDecoder()
    do {
        let decoded = try decoder.decode([Prospect].self, from: data)
        return decoded
    } catch {
        print(error.localizedDescription)
        return nil
    }
}

private func jsonEncode(people: [Prospect]) -> Data? {
    let encoder = JSONEncoder()
    do {
        let encoded = try encoder.encode(people)
        return encoded
    } catch {
        print(error.localizedDescription)
        return nil
    }
}

func loadData(file: String) -> [Prospect]? {
    let url = filePath(filename: file)
    do {
        let data = try Data(contentsOf: url)
        return jsonDecode(data)
    } catch {
        print(error.localizedDescription)
        return nil
    }
}

func saveData(of people: [Prospect], to file: String) {
    let url = filePath(filename: file)
    let encoded = jsonEncode(people: people)
    do {
        try encoded?.write(to: url, options: .atomic)
    } catch {
        print(error.localizedDescription)
    }
}
