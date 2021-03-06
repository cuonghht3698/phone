import { GuidId } from './../ERole';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
@Injectable({
  providedIn: 'root',
})
export class KhoService {
  baseApi = environment.ApiUrl + 'khos/';
  constructor(private http: HttpClient) {}
  GetTonKho(paramProc) {
    return this.http.post(this.baseApi + 'GetTonKho', paramProc);
  }
  GetPage(data) {
    return this.http.get(this.baseApi + 'GetPage', { params: data  });
  }
  GetAllKho() {
    return this.http.get(this.baseApi + 'GetAllKho');
  }
  Create(data) {
    data.Id = GuidId.EmptyId;
    return this.http.post(this.baseApi, data);
  }

  Update(data) {
    return this.http.put(this.baseApi, data);
  }

  Delete(id) {
    return this.http.delete(this.baseApi + id);
  }
}
