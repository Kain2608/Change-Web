//SIDER
const sider = document.querySelector(".sider");
if (sider) {
  const pathList = document.querySelectorAll("a");
  const pathCurrent = location.pathname;
  const splitPath = pathCurrent.split("/");
  pathList.forEach((item) => {
    const getHref = item.getAttribute("href");
    const splitGetHref = getHref.split("/");
    if (splitPath[1] == splitGetHref[1] && splitPath[2] == splitGetHref[2]) {
      item.classList.add("active");
    }
  });
}
// END SIDER
// Menu Mobile
const buttonMenuMobile = document.querySelector(".header .inner-button-menu");
if (buttonMenuMobile) {
  const sider = document.querySelector(".sider");
  const siderOverlay = document.querySelector(".sider-overlay");

  buttonMenuMobile.addEventListener("click", () => {
    sider.classList.add("active");
    siderOverlay.classList.add("active");
  });

  siderOverlay.addEventListener("click", () => {
    sider.classList.remove("active");
    siderOverlay.classList.remove("active");
  });
}
// End Menu Mobile

// Schedule Section 8
const scheduleSection8 = document.querySelector(".section-8 .inner-schedule");
if (scheduleSection8) {
  const buttonCreate = scheduleSection8.querySelector(".inner-schedule-create");
  const listItem = scheduleSection8.querySelector(".inner-schedule-list");

  // Tạo mới
  if (buttonCreate) {
    buttonCreate.addEventListener("click", () => {
      const firstItem = listItem.querySelector(".inner-schedule-item");
      const cloneItem = firstItem.cloneNode(true);
      cloneItem.querySelector(".inner-schedule-head input").value = "";

      const body = cloneItem.querySelector(".inner-schedule-body");
      const id = `mce_${Date.now()}`;
      body.innerHTML = `<textarea textarea-mce id="${id}"></textarea>`;

      listItem.appendChild(cloneItem);

      initTinyMCE(`#${id}`);
    });
  }

  listItem.addEventListener("click", (event) => {
    // Đóng/mở item
    if (event.target.closest(".inner-more")) {
      const parentItem = event.target.closest(".inner-schedule-item");
      if (parentItem) {
        parentItem.classList.toggle("hidden");
      }
    }

    // Xóa item
    if (event.target.closest(".inner-remove")) {
      const parentItem = event.target.closest(".inner-schedule-item");
      const totalItem = listItem.querySelectorAll(
        ".inner-schedule-item",
      ).length;
      if (parentItem && totalItem > 1) {
        parentItem.remove();
      }
    }
  });

  // Sắp xếp
  new Sortable(listItem, {
    animation: 150, // Thêm hiệu ứng mượt mà
    handle: ".inner-move", // Chỉ cho phép kéo bằng class .inner-move
    onStart: (event) => {
      const textarea = event.item.querySelector("[textarea-mce]");
      const id = textarea.id;
      tinymce.get(id).remove();
    },
    onEnd: (event) => {
      const textarea = event.item.querySelector("[textarea-mce]");
      const id = textarea.id;
      initTinyMCE(`#${id}`);
    },
  });
}
// End Schedule Section 8

// Filepond Image
const listFilepondImage = document.querySelectorAll("[filepond-image]");
let filePond = {};
if (listFilepondImage.length > 0) {
  listFilepondImage.forEach((filepondImage) => {
    FilePond.registerPlugin(FilePondPluginImagePreview);
    FilePond.registerPlugin(FilePondPluginFileValidateType);
    let files = [];
    const elementImageDefault = filepondImage.closest("[image-default]");
    if (elementImageDefault) {
      const imageDefault = elementImageDefault.getAttribute("image-default");
      if (imageDefault) {
        files = [
          {
            source: imageDefault,
            options: {
              type: "local",
            },
          },
        ];
      }
    }
    filePond[filepondImage.name] = FilePond.create(filepondImage, {
      labelIdle: "+",
      acceptedFileTypes: ["image/*"],
      files: files,
      storeAsFile: true,
      server: {
        load: (source, load, error, progress, abort, headers) => {
          fetch(source)
            .then((res) => res.blob())
            .then(load)
            .catch(error);
        },
      },
    });
  });
}
// End Filepond Image
// // FilePond Image - Phiên bản mới
// const listFilepondImage = document.querySelectorAll("[filepond-image]");
// let filePond = {}; // Lưu các instance theo name

// if (listFilepondImage.length > 0) {
//   FilePond.registerPlugin(FilePondPluginImagePreview, FilePondPluginFileValidateType);

//   listFilepondImage.forEach((input) => {
//     let files = [];

//     // Nếu có ảnh mặc định
//     const containerDefault = input.closest("[image-default]");
//     if (containerDefault) {
//       const defaultImage = containerDefault.getAttribute("image-default");
//       if (defaultImage) {
//         files.push({
//           source: defaultImage,
//           options: {
//             type: "local", // đánh dấu là file local, không upload lại
//           },
//         });
//       }
//     }

//     // Tạo instance FilePond
//     filePond[input.name] = FilePond.create(input, {
//       allowMultiple: false,
//       labelIdle: "+",
//       acceptedFileTypes: ['image/*'],
//       files: files,
//       server: null, // Nếu không dùng upload async, để null -> form submit bình thường
//     });
//   });
// }
// Biểu đồ doanh thu
const revenueChart = document.querySelector("#revenue-chart");
if (revenueChart) {
  new Chart(revenueChart, {
    type: "line",
    data: {
      labels: ["01", "02", "03", "04", "05"],
      datasets: [
        {
          label: "Tháng 04/2025", // Nhãn của dataset
          data: [1200000, 1800000, 3200000, 900000, 1600000], // Dữ liệu
          borderColor: "#4379EE", // Màu viền
          borderWidth: 1.5, // Độ dày của đường
        },
        {
          label: "Tháng 03/2025", // Nhãn của dataset
          data: [1000000, 900000, 1200000, 1200000, 1400000], // Dữ liệu
          borderColor: "#EF3826", // Màu viền
          borderWidth: 1.5, // Độ dày của đường
        },
      ],
    },
    options: {
      plugins: {
        legend: {
          position: "bottom",
        },
      },
      scales: {
        x: {
          title: {
            display: true,
            text: "Ngày",
          },
        },
        y: {
          title: {
            display: true,
            text: "Doanh thu (VND)",
          },
        },
      },
      maintainAspectRatio: false, // Không giữ tỷ lệ khung hình mặc định
    },
  });
}
// Hết Biểu đồ doanh thu

// Category Create Form
const categoryCreateForm = document.querySelector("#category-create-form");
if (categoryCreateForm) {
  const validation = new JustValidate("#category-create-form");

  validation
    .addField("#name", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập tên danh mục!",
      },
    ])
    .onSuccess((event) => {
      event.preventDefault();
      const name = event.target.name.value;
      const status = event.target.status.value;
      const avatars = filePond.avatar.getFiles();
      let avatar = null;
      if (avatars.length > 0) {
        avatar = avatars[0].file;
      }
      const description = tinymce.get("description").getContent();
      event.target.submit();
    });
}
// End Category Create Form

// Category edit Form
const categoryEditForm = document.querySelector("#category-edit-form");
if (categoryEditForm) {
  const validation = new JustValidate("#category-edit-form");

  validation
    .addField("#name", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập tên danh mục!",
      },
    ])
    .onSuccess((event) => {
      event.preventDefault();
      const name = event.target.name.value;
      const status = event.target.status.value;
      const avatars = filePond.avatar?.getFiles();
      const description = tinymce.get("description").getContent();
      event.target.submit();
    });
}
// End Category Create Form

// Tour Create Form
const tourCreateForm = document.querySelector("#tour-create-form");
if (tourCreateForm) {
  const validation = new JustValidate("#tour-create-form");

  validation
    .addField("#name", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập tên tour!",
      },
    ])
    .onSuccess((event) => {
      const name = event.target.name.value;
      const category = event.target.category.value;
      const position = event.target.position.value;
      const status = event.target.status.value;
      const avatars = filePond.avatar.getFiles();
      let avatar = null;
      if (avatars.length > 0) {
        avatar = avatars[0].file;
      }
      const priceAdult = event.target.priceAdult.value;
      const priceChildren = event.target.priceChildren.value;
      const priceBaby = event.target.priceBaby.value;
      const priceNewAdult = event.target.priceNewAdult.value;
      const priceNewChildren = event.target.priceNewChildren.value;
      const priceNewBaby = event.target.priceNewBaby.value;
      const stockAdult = event.target.stockAdult.value;
      const stockChildren = event.target.stockChildren.value;
      const stockBaby = event.target.stockBaby.value;
      const locations = [];
      const time = event.target.time.value;
      const vehicle = event.target.vehicle.value;
      const departureDate = event.target.departureDate.value;
      const information = tinymce.get("information").getContent();
      const schedules = [];

      // locations
      const listElementLocation = tourCreateForm.querySelectorAll(
        'input[name="locations"]:checked',
      );
      listElementLocation.forEach((input) => {
        locations.push(input.value);
      });
      // End locations

      // schedules
      const listElementScheduleItem = tourCreateForm.querySelectorAll(
        ".inner-schedule-item",
      );
      listElementScheduleItem.forEach((scheduleItem) => {
        const input = scheduleItem.querySelector("input");
        const title = input.value;

        const textarea = scheduleItem.querySelector("textarea");
        const idTextarea = textarea.id;
        const description = tinymce.get(idTextarea).getContent();

        schedules.push({
          title: title,
          description: description,
        });
      });
      // End schedules

      console.log(name);
      console.log(category);
      console.log(position);
      console.log(status);
      console.log(avatar);
      console.log(priceAdult);
      console.log(priceChildren);
      console.log(priceBaby);
      console.log(priceNewAdult);
      console.log(priceNewChildren);
      console.log(priceNewBaby);
      console.log(stockAdult);
      console.log(stockChildren);
      console.log(stockBaby);
      console.log(locations);
      console.log(time);
      console.log(vehicle);
      console.log(departureDate);
      console.log(information);
      console.log(schedules);
    });
}
// End Tour Create Form

// Order Edit Form
const orderEditForm = document.querySelector("#order-edit-form");
if (orderEditForm) {
  const validation = new JustValidate("#order-edit-form");

  validation
    .addField("#fullName", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập họ tên!",
      },
      {
        rule: "minLength",
        value: 5,
        errorMessage: "Họ tên phải có ít nhất 5 ký tự!",
      },
      {
        rule: "maxLength",
        value: 50,
        errorMessage: "Họ tên không được vượt quá 50 ký tự!",
      },
    ])
    .addField("#phone", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập số điện thoại!",
      },
      {
        rule: "customRegexp",
        value: /(84|0[3|5|7|8|9])+([0-9]{8})\b/g,
        errorMessage: "Số điện thoại không đúng định dạng!",
      },
    ])
    .onSuccess((event) => {
      const fullName = event.target.fullName.value;
      const phone = event.target.phone.value;
      const note = event.target.note.value;
      const paymentMethod = event.target.paymentMethod.value;
      const paymentStatus = event.target.paymentStatus.value;
      const status = event.target.status.value;

      console.log(fullName);
      console.log(phone);
      console.log(note);
      console.log(paymentMethod);
      console.log(paymentStatus);
      console.log(status);
    });
}
// End Order Edit Form

// Setting Website Info Form
const settingWebsiteInfoForm = document.querySelector(
  "#setting-website-info-form",
);
if (settingWebsiteInfoForm) {
  const validation = new JustValidate("#setting-website-info-form");

  validation
    .addField("#websiteName", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập tên website!",
      },
    ])
    .addField("#email", [
      {
        rule: "email",
        errorMessage: "Email không đúng định dạng!",
      },
    ])
    .onSuccess((event) => {
      const websiteName = event.target.websiteName.value;
      const phone = event.target.phone.value;
      const email = event.target.email.value;
      const address = event.target.address.value;
      const logos = filePond.logo.getFiles();
      let logo = null;
      if (logos.length > 0) {
        logo = logos[0].file;
      }
      const favicons = filePond.favicon.getFiles();
      let favicon = null;
      if (favicons.length > 0) {
        favicon = favicons[0].file;
      }

      console.log(websiteName);
      console.log(phone);
      console.log(email);
      console.log(address);
      console.log(logo);
      console.log(favicon);
    });
}
// End Setting Website Info Form

// Setting Account Admin Create Form
const settingAccountAdminCreateForm = document.querySelector(
  "#setting-account-admin-create-form",
);
if (settingAccountAdminCreateForm) {
  const validation = new JustValidate("#setting-account-admin-create-form");

  validation
    .addField("#fullName", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập họ tên!",
      },
      {
        rule: "minLength",
        value: 5,
        errorMessage: "Họ tên phải có ít nhất 5 ký tự!",
      },
      {
        rule: "maxLength",
        value: 50,
        errorMessage: "Họ tên không được vượt quá 50 ký tự!",
      },
    ])
    .addField("#email", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập email!",
      },
      {
        rule: "email",
        errorMessage: "Email không đúng định dạng!",
      },
    ])
    .addField("#phone", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập số điện thoại!",
      },
      {
        rule: "customRegexp",
        value: /(84|0[3|5|7|8|9])+([0-9]{8})\b/g,
        errorMessage: "Số điện thoại không đúng định dạng!",
      },
    ])
    .addField("#positionCompany", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập chức vụ!",
      },
    ])
    .addField("#password", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập mật khẩu!",
      },
      {
        validator: (value) => value.length >= 8,
        errorMessage: "Mật khẩu phải chứa ít nhất 8 ký tự!",
      },
      {
        validator: (value) => /[A-Z]/.test(value),
        errorMessage: "Mật khẩu phải chứa ít nhất một chữ cái in hoa!",
      },
      {
        validator: (value) => /[a-z]/.test(value),
        errorMessage: "Mật khẩu phải chứa ít nhất một chữ cái thường!",
      },
      {
        validator: (value) => /\d/.test(value),
        errorMessage: "Mật khẩu phải chứa ít nhất một chữ số!",
      },
      {
        validator: (value) => /[@$!%*?&]/.test(value),
        errorMessage: "Mật khẩu phải chứa ít nhất một ký tự đặc biệt!",
      },
    ])
    .onSuccess((event) => {
      const fullName = event.target.fullName.value;
      const email = event.target.email.value;
      const phone = event.target.phone.value;
      const role = event.target.role.value;
      const positionCompany = event.target.positionCompany.value;
      const status = event.target.status.value;
      const password = event.target.password.value;
      const avatars = filePond.avatar.getFiles();
      let avatar = null;
      if (avatars.length > 0) {
        avatar = avatars[0].file;
      }

      console.log(fullName);
      console.log(email);
      console.log(phone);
      console.log(role);
      console.log(positionCompany);
      console.log(status);
      console.log(password);
      console.log(avatar);
    });
}
// End Setting Account Admin Create Form

// Setting Role Create Form
const settingRoleCreateForm = document.querySelector(
  "#setting-role-create-form",
);
if (settingRoleCreateForm) {
  const validation = new JustValidate("#setting-role-create-form");

  validation
    .addField("#name", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập tên nhóm quyền!",
      },
    ])
    .onSuccess((event) => {
      const name = event.target.name.value;
      const description = event.target.description.value;
      const permissions = [];

      // permissions
      const listElementPermission = settingRoleCreateForm.querySelectorAll(
        'input[name="permissions"]:checked',
      );
      listElementPermission.forEach((input) => {
        permissions.push(input.value);
      });
      // End permissions

      console.log(name);
      console.log(description);
      console.log(permissions);
    });
}
// End Setting Role Create Form

// Profile Edit Form

const profileEditForm = document.querySelector("#profile-edit-form");
if (profileEditForm) {
  const validation = new JustValidate("#profile-edit-form");

  validation
    .addField("#fullName", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập họ tên!",
      },
      {
        rule: "minLength",
        value: 5,
        errorMessage: "Họ tên phải có ít nhất 5 ký tự!",
      },
      {
        rule: "maxLength",
        value: 50,
        errorMessage: "Họ tên không được vượt quá 50 ký tự!",
      },
    ])
    .addField("#email", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập email!",
      },
      {
        rule: "email",
        errorMessage: "Email không đúng định dạng!",
      },
    ])
    .addField("#phone", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập số điện thoại!",
      },
      {
        rule: "customRegexp",
        value: /(84|0[3|5|7|8|9])+([0-9]{8})\b/g,
        errorMessage: "Số điện thoại không đúng định dạng!",
      },
    ])
    .onSuccess((event) => {
      // Chỉ cần gọi submit, trình duyệt sẽ tự động gửi các input và file ảnh gốc đi
      event.target.submit();
    });
}
// End Profile Edit Form

// Profile Change Password Form
const profileChangePasswordForm = document.querySelector(
  "#profile-change-password-form",
);
if (profileChangePasswordForm) {
  const validation = new JustValidate("#profile-change-password-form");

  validation
    .addField("#password", [
      {
        rule: "required",
        errorMessage: "Vui lòng nhập mật khẩu!",
      },
      {
        validator: (value) => value.length >= 8,
        errorMessage: "Mật khẩu phải chứa ít nhất 8 ký tự!",
      },
      {
        validator: (value) => /[A-Z]/.test(value),
        errorMessage: "Mật khẩu phải chứa ít nhất một chữ cái in hoa!",
      },
      {
        validator: (value) => /[a-z]/.test(value),
        errorMessage: "Mật khẩu phải chứa ít nhất một chữ cái thường!",
      },
      {
        validator: (value) => /\d/.test(value),
        errorMessage: "Mật khẩu phải chứa ít nhất một chữ số!",
      },
      {
        validator: (value) => /[@$!%*?&]/.test(value),
        errorMessage: "Mật khẩu phải chứa ít nhất một ký tự đặc biệt!",
      },
    ])
    .addField("#confirmPassword", [
      {
        rule: "required",
        errorMessage: "Vui lòng xác nhận mật khẩu!",
      },
      {
        validator: (value, fields) => {
          const password = fields["#password"].elem.value;
          return value == password;
        },
        errorMessage: "Mật khẩu xác nhận không khớp!",
      },
    ])
    .onSuccess((event) => {
      const password = event.target.password.value;
      console.log(password);
    });
}
// End Profile Change Password Form
// Racket Create Form
const racketCreateForm = document.querySelector("#racket-create-form");

if (racketCreateForm) {
  const validationRacket = new JustValidate("#racket-create-form");

  validationRacket
    .addField("#name", [
      { rule: "required", errorMessage: "Vui lòng nhập tên vợt!" },
    ])
    .addField("#categoryId", [ // Đổi id cho khớp với JSP mới
      { rule: "required", errorMessage: "Vui lòng chọn danh mục!" },
    ])
    .addField("#brandId", [
      { rule: "required", errorMessage: "Vui lòng chọn thương hiệu!" },
    ])
    .addField("#price", [
      { rule: "required", errorMessage: "Vui lòng nhập giá gốc!" },
    ])
    .addField("#stock", [
      { rule: "required", errorMessage: "Vui lòng nhập số lượng tồn kho!" },
    ])
    .onSuccess((event) => {
      if (window.tinymce) {
        tinymce.triggerSave(); 
      }

      event.target.submit();
    });
}
const shoesForm = document.querySelector("#shoes-create-form");

if (shoesForm) {
  const validationShoes = new JustValidate("#shoes-create-form");

  validationShoes
    .addField("#name", [
      { rule: "required", errorMessage: "Tên giày không được để trống!" }
    ])
    .addField("#categoryId", [ 
      { rule: "required", errorMessage: "Vui lòng chọn danh mục!" }
    ])
    .addField("#brandId", [ 
      { rule: "required", errorMessage: "Vui lòng chọn thương hiệu!" }
    ])
    .addField("#price", [
      { rule: "required", errorMessage: "Giá gốc không được để trống!" }
    ])
    .onSuccess((event) => {
      event.target.submit(); 
    });
}





function toggleMenu() {
  const menu = document.getElementById("createMenu");
  menu.style.display = menu.style.display === "block" ? "none" : "block";
}
document.addEventListener("click", function (e) {
  const box = document.querySelector(".create-box");
  const menu = document.getElementById("createMenu");

  if (box && menu) {
    if (!box.contains(e.target)) {
      menu.style.display = "none";
    }
  }
});
// Filter-status
const filterStatus = document.querySelector("[filter-status]");

if (filterStatus) {
  const url = new URL(window.location.href);
  filterStatus.addEventListener("change", () => {
    const value = filterStatus.value;
    if (value) {
      url.searchParams.set("status", value);
    } else {
      url.searchParams.delete("status");
    }
    window.location.href = url.href;
  });
  //Hiển thị lựa chọn mặc định
  const valueCurrent = url.searchParams.get("status");
  if (valueCurrent) {
    filterStatus.value = valueCurrent;
  }
}
//End Filter-status
//Fileter-Create-By
const filterCreateBy = document.querySelector("[filter-create-by]");
if (filterCreateBy) {
  const url = new URL(window.location.href);
  filterCreateBy.addEventListener("change", () => {
    const value = filterCreateBy.value;
    if (value) {
      url.searchParams.set("createdBy", value);
    } else {
      url.searchParams.delete("createdBy");
    }
    window.location.href = url.href;
  });
  const valueCurrent = url.searchParams.get("createdBy");
  if (valueCurrent) {
    filterCreateBy.value = valueCurrent;
  }
}
//End filterCreateBy
//Reset
const btnReset = document.querySelector("[btn-reset]");

if (btnReset) {
  btnReset.addEventListener("click", () => {
    const url = location.origin + location.pathname;
    window.location.href = url;
  });
}
//Page
const filterPage = document.querySelector("[filter-page]");
if (filterPage) {
  const url = new URL(window.location.href);
  filterPage.addEventListener("change", () => {
    const value = filterPage.value;
    if (value) url.searchParams.set("page", value);
    else url.searchParams.delete("page");
    window.location.href = url.href;
  });
  const valueCurrent = url.searchParams.get("page");
  if (valueCurrent) filterPage.value = valueCurrent;
}
//End Page
document.addEventListener("DOMContentLoaded", function () {
  const cameraBtn = document.querySelector(".profile-avatar-edit");
  const avatarInput = document.getElementById("avatar");
  const avatarContainer = document.querySelector(".profile-avatar");

  if (cameraBtn && avatarInput) {
    cameraBtn.addEventListener("click", function () {
      avatarInput.click();
    });
    avatarInput.addEventListener("change", function (event) {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
          avatarContainer.innerHTML = `<img src="${e.target.result}" alt="Avatar Preview" style="width:100%; height:100%; object-fit:cover; border-radius:50%;">`;
        };
        reader.readAsDataURL(file);
      }
    });
  }
});





// --- 1. QUẢN LÝ MODAL & CHUYỂN TRANG (CHO TRANG LIST) ---
function openModal() {
    document.getElementById("modal")?.classList.remove("hidden");
}

function closeModal() {
    document.getElementById("modal")?.classList.add("hidden");
}

function goTo(type) {
    window.location.href = "/admin/product/" + type;
}

// Bộ lọc loại sản phẩm tại Client
document.getElementById("filterType")?.addEventListener("change", function () {
    const selectedType = this.value;
    const rows = document.querySelectorAll("tbody tr");

    rows.forEach(row => {
        const type = row.getAttribute("data-type");
        if (!selectedType || type === selectedType) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    });
});

// --- 2. QUẢN LÝ BIẾN THỂ (CHO TRANG CREATE/EDIT) ---
const scheduleSection = document.querySelector(".inner-schedule");

if (scheduleSection) {
    const btnCreateVariant = scheduleSection.querySelector(".inner-schedule-create");
    const listVariant = scheduleSection.querySelector(".inner-schedule-list");

    if (btnCreateVariant && listVariant) {
        btnCreateVariant.addEventListener("click", () => {
            const firstSizeSelect = listVariant.querySelector('select[name="variant_sizes[]"]');
            const firstColorSelect = listVariant.querySelector('select[name="variant_colors[]"]');
            
            if (!firstSizeSelect || !firstColorSelect) {
                toastr.error("Không tìm thấy mẫu biến thể!");
                return;
            }

            const sizeOptions = firstSizeSelect.innerHTML;
            const colorOptions = firstColorSelect.innerHTML;

            const newVariant = document.createElement("div");
            newVariant.classList.add("inner-schedule-item");
            newVariant.style.cssText = "border: 1px solid #ddd; padding: 15px; margin-bottom: 10px; position: relative; border-radius: 4px;";

            newVariant.innerHTML = `
                <div class="inner-schedule-head" style="display: flex; gap: 10px; align-items: center;">
                    <div class="inner-move" style="cursor: move;"><i class="fa-solid fa-grip-vertical"></i></div>
                    <select name="variant_sizes[]" style="flex: 1;" required>
                        ${sizeOptions}
                    </select>
                    <select name="variant_colors[]" style="flex: 1;" required>
                        ${colorOptions}
                    </select>
                    <input type="number" name="variant_stocks[]" placeholder="Số lượng" style="flex: 1;" min="0" value="0">
                    <div class="inner-remove" style="cursor: pointer; color: red;"><i class="fa-solid fa-trash"></i></div>
                </div>
            `;
            listVariant.appendChild(newVariant);
            toastr.success("Đã thêm biến thể mới.");
        });
    }

    // Xóa biến thể (Event Delegation)
    scheduleSection.addEventListener("click", (e) => {
        const removeBtn = e.target.closest(".inner-remove");
        if (removeBtn) {
            const allItems = scheduleSection.querySelectorAll(".inner-schedule-item");
            if (allItems.length <= 1) {
                toastr.warning("Phải có ít nhất một biến thể!");
                return;
            }
            removeBtn.closest(".inner-schedule-item")?.remove();
            toastr.info("Đã xóa biến thể.");
        }
    });
}

// --- 3. SỬA LỖI MENU (FIX DÒNG 873) ---
document.querySelector(".inner-button-menu")?.addEventListener("click", () => {
    document.querySelector(".sider")?.classList.toggle("active");
    document.querySelector(".sider-overlay")?.classList.toggle("active");
});

document.querySelector(".sider-overlay")?.addEventListener("click", () => {
    document.querySelector(".sider")?.classList.remove("active");
    document.querySelector(".sider-overlay")?.classList.remove("active");
});