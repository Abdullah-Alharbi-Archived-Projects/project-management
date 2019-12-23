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
          >
          </el-input>
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
        </div>

        <div class="submit">
          <el-button native-type="submit">Sign in</el-button>
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
  }
};
</script>

<style scoped>
.sign-in {
  /* width: 250px; */
  display: flex;
  flex-direction: column;
  justify-items: center;
  align-items: center;
}
.bg-white {
  background: #ffffffb7;
  padding: 18px;
  box-shadow: 0 0 8px #fff;
  border-radius: 4px;
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
</style>
