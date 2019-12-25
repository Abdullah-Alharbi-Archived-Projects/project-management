<template>
  <div class="sign-in">
    <div class="container">
      <div class="bg-white">
        <h2 class="mb-25">Sign in</h2>

        <div class="email">
          <el-input
            placeholder="Email"
            name="user[email]"
            id="user_email"
            v-model="inputs.email"
            type="email"
            clearable
          ></el-input>
        </div>

        <div class="password">
          <el-input
            placeholder="Please input password"
            name="user[password]"
            id="user_password"
            v-model="inputs.password"
            show-password
          ></el-input>
        </div>

        <div class="remember">
          <el-checkbox
            v-model="checked"
            name="user[remember_me]"
            id="user_remember_me"
            >Remember Me</el-checkbox
          >
          <div class="mt-5">
            <el-link type="warning" href="/users/password/new/"
              >Forgot password ?</el-link
            >
          </div>
        </div>

        <div class="submit">
          <el-row justify="space-between" :gutter="20">
            <el-col :span="6">
              <el-button native-type="submit">Sign in</el-button>
            </el-col>
            <el-col :span="6" :offset="11">
              <el-button
                native-type="submit"
                type="primary"
                @click.prevent="redirect_to_sign_up"
                >Sign up</el-button
              >
            </el-col>
          </el-row>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "sign-in",
  data() {
    return {
      inputs: {
        email: "",
        password: ""
      },
      checked: false
    };
  },
  methods: {
    redirect_to_sign_up() {
      window.location.href = "/users/sign_up";
    }
  }
};
</script>

<style scoped>
.sign-in {
  display: flex;
  flex-direction: column;
  justify-items: center;
  align-items: center;
}
.bg-white {
  padding: 18px;
  background: #fff !important;
}
.container {
  display: flex;
  flex-direction: column;
  width: 400px;
  justify-content: center;
}
.sign-in,
.container {
  height: 100% !important;
}
.email {
  margin-bottom: 15px;
}

.password {
  margin-bottom: 15px;
}

.remember {
  margin-bottom: 15px;
}

.mt-5 {
  margin-top: 5px;
}
</style>
