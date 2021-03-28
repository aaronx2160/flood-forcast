<template>
  <navbar>
    <button class="navbar-toggler mobile-sidebar-toggler d-lg-none" type="button" @click="mobileSidebarToggle">&#9776;
    </button>
    <a class="navbar-brand"></a>
    <ul class="nav navbar-nav d-md-down-none">
      <li class="nav-item">
        <a class="nav-link navbar-toggler sidebar-toggler" @click="sidebarMinimize">&#9776;</a>
      </li>
    </ul>

    <ul class="nav navbar-nav d-md-down-none">

      <li class="nav-item header-item">


        <router-link tag="div" to='/' style="height:55px;" class="nav-link">
          <span class="iconfont icon-gaikuangpitchon nav-icon"></span>
          <p> 平台概况 </p>
        </router-link>
      </li>
      <li class="nav-item header-item">


        <router-link tag="div" to='/' style="height:55px;" class="nav-link">
          <span class="iconfont icon-jiankong nav-icon"></span>
          <p> 实时监控 </p>
        </router-link>
      </li>
      <li class="nav-item header-item">


        <router-link tag="div" to='/' style="height:55px;" class="nav-link">
          <span class="iconfont icon-shujufenxi nav-icon"></span>
          <p> 查询分析 </p>
        </router-link>
      </li>
      <li class="nav-item header-item">


        <router-link tag="div" to='/' style="height:55px;" class="nav-link">
          <span class="iconfont icon-rizhi nav-icon"></span>
          <p> 日志管理 </p>
        </router-link>
      </li>
      <li class="nav-item header-item">


        <router-link tag="div" to='/' style="height:55px;" class="nav-link">
          <span class="iconfont icon-rizhi-zhongduan nav-icon"></span>
          <p> 终端管理 </p>
        </router-link>
      </li>
      <li class="nav-item header-item">

        <router-link tag="div" to='/home1' style="height:55px;" class="nav-link">
          <span class="iconfont icon-xitongguanli- nav-icon"></span>
          <p> 系统管理 </p>
        </router-link>


      </li>

      <li class="nav-item header-item">
        <!--   -->
        <router-link tag="div" to='/' style="height:55px;" class="nav-link">
          <span class="iconfont icon-shengban-shengji nav-icon"></span>
          <p> 升级管理 </p>
        </router-link>
      </li>


      <li class="nav-item header-item">


        <router-link tag="div" to='/home1' style="height:55px;" class="nav-link">
          <span class="iconfont icon-renwu nav-icon"></span>
          <p> 任务管理 </p>
        </router-link>


      </li>


    </ul>


    <ul class="nav navbar-nav ml-auto">

      <li class="nav-item d-md-down-none">
        <a class="nav-link">
          <Icon type="android-notifications" size="20"></Icon>
          <span class="badge badge-pill badge-danger">5</span></a>
      </li>


      <Dropdown class="nav-item">
        <a href="javascript:void(0)">
           <span slot="button">
          <img src="static/img/avatars/6.jpg" class="img-avatar" alt="o">
          <span class="d-md-down-none">admin</span>
          </span>
        </a>
        <Dropdown-menu slot="list">
          <Dropdown-item>
            <p class="dropdown-itemp">
              <Icon type="alert"></Icon>
              Updates<span class="badge badge-info">42</span></p>


          </Dropdown-item>
          <Dropdown-item>
            <p class="dropdown-itemp">
              <Icon type="chatbox-working"></Icon>
              Messages<span class="badge badge-success">42</span></p>

          </Dropdown-item>
          <Dropdown-item>
            <p class="dropdown-itemp">
              <Icon type="chatbox-working"></Icon>
              Messages<span class="badge badge-danger">42</span></p>

          </Dropdown-item>
          <Dropdown-item divided>
            <p class="dropdown-itemp">
              <Icon type="android-contact"></Icon>
              Profile
            </p>

          </Dropdown-item>
          <Dropdown-item>
            <p class="dropdown-itemp">
              <Icon type="android-settings"></Icon>
              Settings
            </p>
          </Dropdown-item>

          <Dropdown-item><a href="" @click="Logout">
            <p class="dropdown-itemp">
              <Icon type="power"></Icon>
              Logout
            </p>
          </a></Dropdown-item>

        </Dropdown-menu>
      </Dropdown>


      <li class="nav-item d-md-down-none">
        <a class="nav-link navbar-toggler aside-menu-toggler" @click="asideToggle">&#9776;</a>
      </li>
    </ul>
  </navbar>
</template>
<script>

import navbar from './Navbar'
import {GETMENULIST} from "../store/types";
import axios from "axios";


export default {
  name: 'header',
  components: {
    navbar,
  },
  mounted() {
    // console.log('hi')
    // this.$store.dispatch(GETMENULIST)
    // axios.get('http://localhost:8000/menulist/1')
  },
  methods: {
    Logout(e) {
      e.preventDefault();
      this.$store.dispatch('LogOut').then(() => {
        this.$router.push({path: '/login'});
      }).catch(err => {
        this.$message.error(err);
      });
    },
    click() {
      // do nothing
    },
    sidebarToggle(e) {
      e.preventDefault()
      document.body.classList.toggle('sidebar-hidden')
    },
    sidebarMinimize(e) {
      e.preventDefault()

      document.body.classList.toggle('sidebar-minimized')
    },
    mobileSidebarToggle(e) {
      e.preventDefault()

      document.body.classList.toggle('sidebar-mobile-show')
    },
    asideToggle(e) {
      e.preventDefault()
      document.body.classList.toggle('aside-menu-hidden')
    }
  }
}
</script>

<style lang="less" scoped>
.dropdown-itemp {
  text-align: left;
  font-size: 15px;
  padding: 10px;
}

.header-item {
  width: 130px;
  height: 55px;
  a {
    color: dodgerblue !important;
  }
}

.nav-link{
  .nav-icon {
    font-size: x-large;
    color: dodgerblue;
    margin: 0;
    padding: 0;
  }
  p{
    color: dodgerblue;
  }
}


.isActive {
  .nav-icon {
    font-size: x-large;
    color: white !important;
    margin: 0;
    padding: 0;
  }
  p{
    color: white !important;
  }
}

</style>