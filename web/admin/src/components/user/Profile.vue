<template>
  <div>
    <a-card>
      <a-form-model>
        <a-form-model-item label="作者名称">
          <a-input allow-clear style="width: 300px" v-model="profileInfo.name"></a-input>
        </a-form-model-item>

        <a-form-model-item label="个人简介">
          <a-input allow-clear type="textarea" v-model="profileInfo.desc"></a-input>
        </a-form-model-item>

        <a-form-model-item label="QQ号码">
          <a-input allow-clear style="width: 300px" v-model="profileInfo.qq_chat"></a-input>
        </a-form-model-item>

        <a-form-model-item label="微信">
          <a-input allow-clear style="width: 300px" v-model="profileInfo.wechat"></a-input>
        </a-form-model-item>

        <a-form-model-item label="微博">
          <a-input allow-clear style="width: 300px" v-model="profileInfo.weibo"></a-input>
        </a-form-model-item>

        <a-form-model-item label="B站地址">
          <a-input allow-clear style="width: 300px" v-model="profileInfo.bili"></a-input>
        </a-form-model-item>

        <a-form-model-item label="Email">
          <a-input allow-clear style="width: 300px" v-model="profileInfo.email"></a-input>
        </a-form-model-item>

        <a-form-model-item label="头像">
          <a-upload listType="picture" name="file" :action="upUrl" :headers="headers" @change="avatarChange">
            <a-button> <a-icon type="upload" />点击上传 </a-button>
            <br />
            <template v-if="profileInfo.avatar">
              <img :src="profileInfo.avatar" style="width: 120px; height: 100px" />
            </template>
          </a-upload>
        </a-form-model-item>

        <a-form-model-item label="头像背景图">
          <a-upload listType="picture" name="file" :action="upUrl" :headers="headers" @change="imgChange">
            <a-button> <a-icon type="upload" />点击上传 </a-button>
            <br />
            <template v-if="profileInfo.img">
              <img :src="profileInfo.img" style="width: 120px; height: 100px" />
            </template>
          </a-upload>
        </a-form-model-item>

        <a-form-model-item>
          <a-button type="danger" style="margin-right: 15px" @click="updateProfile">更新</a-button>
        </a-form-model-item>
      </a-form-model>
    </a-card>
  </div>
</template>
<script>
import {Url} from '@/plugin/http'

export default {
  data() {
    return {
      profileInfo: {
        id: 1,
        name: '',
        desc: '',
        qq_chat: '',
        wechat: '',
        weibo: '',
        bili: '',
        email: '',
        img: '',
        avatar: '',
      },
      upUrl: Url + 'upload',
      headers: {},
    }
  },
  created() {
    this.getProfileInfo()
    this.headers = { Authorization: `Bearer ${window.sessionStorage.getItem('token')}` }
  },
  methods: {
    // 获取个人设置
    async getProfileInfo() {
      const { data: res } = await this.$http.get(`admin/profile/${this.profileInfo.id}`)
      if (res.code !== 200) {
        if (res.code === 1004 || 1005 || 1006 || 1007) {
          window.sessionStorage.clear()
          await this.$router.push('/login')
        }
        this.$message.error(res.message)
      }
      this.profileInfo = res.data
    },

    // 上传头像
    avatarChange(info) {
      if (info.file.code !== 'uploading') {
      }
      if (info.file.code === 'done') {
        this.$message.success(`图片上传成功`)
        this.profileInfo.avatar = info.file.response.url
      } else if (info.file.code === 'error') {
        this.$message.error(`图片上传失败`)
      }
    },

    // 上传头像背景图
    imgChange(info) {
      if (info.file.code !== 'uploading') {
      }
      if (info.file.code === 'done') {
        this.$message.success(`图片上传成功`)
        this.profileInfo.img = info.file.response.url
      } else if (info.file.code === 'error') {
        this.$message.error(`图片上传失败`)
      }
    },

    // 更新
    async updateProfile() {
      const { data: res } = await this.$http.put(`profile/${this.profileInfo.id}`, this.profileInfo)
      if (res.code !== 200) return this.$message.error(res.message)
      this.$message.success(`个人信息更新成功`)
      await this.$router.push('/index')
    },
  },
}
</script>
<style lang="">
</style>
