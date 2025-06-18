# 檔案說明

基於 **test2 v6.4.0** 版本檔案修改

## 網站視圖 (Views) 調整

### `Views/Home` 資料夾

- `index.cshtml`：修改 **section** 標籤中 **id** 為 **sec1** ~ **id** 為 **sec4** 的標籤內容，加入首頁內容
- `Login.cshtml`：新增了會員登入頁面。
- `Register.cshtml`：新增了會員註冊頁面。

### `Views/Shared` 資料夾

- `Pheader1.cshtml`: 導覽列的 **Login 連結** 現在可以直接跳轉到會員登入頁面

<br>

## 靜態資源 (wwwroot) 調整

### `wwwroot/css` 資料夾

- `cardFlip.css`：新增了這個檔案，讓熱門書籍推薦區域有**卡片翻轉動畫效果**。
- `loginAndRegisterColor.css`：新增了這個檔案，此檔案包含會員登入頁和會員註冊頁所需的顏色設定。

## `site.css`檔案修改

- #### 為了避免跟 Bootstrap 元件衝突，把這兩段 CSS 選擇器註解掉了：
```
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box !important;
}
```
```
section {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
    width: 100%;
}
```
- #### 新增 #sec5 選擇器：
    為了讓樹不要擋到 **FAQ**，新增了 #sec5 這個選擇器： 

```
#sec5 {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 40vh;
    width: 100%;
}
```

## 控制器 (Controllers) 調整

`HomeController.cs`：

- 新增 Action 方法: 在 HomeController 裡面增加了兩個新的 Action 方法，可以跳轉到會員登入和註冊頁：
```
public IActionResult Login() { return View(); }

public IActionResult Register() { return View(); }
```