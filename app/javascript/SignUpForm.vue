<template>
  <div class="sign-up">
    <div class="container">
      <div class="bg-white">
        <h2 class="mb-25">Sign up</h2>

        <div class="email mb-15">
          <el-input
            placeholder="Email"
            name="user[email]"
            id="user_email"
            v-model="inputs.email"
            type="email"
            clearable
          ></el-input>
        </div>

        <div class="name mb-15">
          <el-input
            placeholder="Name"
            name="user[name]"
            id="user_name"
            v-model="inputs.name"
            type="text"
            clearable
          ></el-input>
        </div>

        <div class="avatar mb-15">
          <el-input
            placeholder="Avatar"
            name="user[avatar]"
            id="user_avatar"
            v-model="inputs.avatar"
            type="text"
            clearable
          ></el-input>
        </div>

        <div class="password mb-15">
          <el-input
            placeholder="Password"
            name="user[password]"
            id="user_password"
            v-model="inputs.password"
            show-password
          ></el-input>
        </div>

        <div class="password_confirmation mb-15">
          <el-input
            placeholder="Password"
            name="user[password_confirmation]"
            id="user_password_confirmation"
            v-model="inputs.password_confirm"
            show-password
          ></el-input>
        </div>

        <div class="submit">
          <el-row justify="space-between" :gutter="20">
            <el-col :span="6">
              <el-button native-type="submit">Sign up</el-button>
            </el-col>
            <el-col :span="6" :offset="11">
              <el-button
                native-type="submit"
                type="primary"
                @click.prevent="redirect_to_sign_in"
              >Sign in</el-button>
            </el-col>
          </el-row>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "sign-up",
  data() {
    return {
      inputs: {
        email: "",
        name: "",
        avatar: "",
        password: "",
        password_confirm: ""
      },
      checked: false
    };
  },
  methods: {
    redirect_to_sign_in() {
      window.location.href = "/users/sign_in";
    }
  }
};
</script>

<style scoped>
.sign-up {
  /* width: 250px; */
  display: flex;
  flex-direction: column;
  justify-items: center;
  align-items: center;
}
.bg-white {
  /* background: #ffffffb7; */
  padding: 18px;
  /* box-shadow: 0 0 8px #fff; */
  /* border-radius: 4px; */
}
.container {
  display: flex;
  flex-direction: column;
  width: 400px;
  justify-content: center;
}
.sign-up,
.container {
  height: 100% !important;
}
.mb-15 {
  margin-bottom: 15px;
}

.mt-5 {
  margin-top: 5px;
}
</style>
