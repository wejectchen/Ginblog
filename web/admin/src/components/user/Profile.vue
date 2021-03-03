<template>
  <a-card>
    <a-form-model labelAlign="left" :label-col="{ span: 2 }" :wrapper-col="{ span: 12 }">
      <a-form-model-item label="作者名称">
        <a-input style="width: 300px" v-model="profileInfo.name"></a-input>
      </a-form-model-item>

      <a-form-model-item label="个人简介">
        <a-input type="textarea" v-model="profileInfo.desc"></a-input>
      </a-form-model-item>

      <a-form-model-item label="网站备案号">
        <a-input style="width: 300px" v-model="profileInfo.icp_record"></a-input>
      </a-form-model-item>

      <a-form-model-item label="QQ号码">
        <a-input style="width: 300px" v-model="profileInfo.qq_chat"></a-input>
      </a-form-model-item>

      <a-form-model-item label="微信">
        <a-input style="width: 300px" v-model="profileInfo.wechat"></a-input>
      </a-form-model-item>

      <a-form-model-item label="微博">
        <a-input style="width: 300px" v-model="profileInfo.weibo"></a-input>
      </a-form-model-item>

      <a-form-model-item label="B站地址">
        <a-input style="width: 300px" v-model="profileInfo.bili"></a-input>
      </a-form-model-item>

      <a-form-model-item label="Email">
        <a-input style="width: 300px" v-model="profileInfo.email"></a-input>
      </a-form-model-item>

      <a-form-model-item label="头像">
        <a-upload
          listType="picture"
          name="file"
          :action="upUrl"
          :headers="headers"
          @change="avatarChange"
        >
          <a-button style="margin-right:10px">
            <a-icon type="upload" />点击上传
          </a-button>

          <template v-if="profileInfo.avatar">
            <img :src="profileInfo.avatar" style="width: 120px; height: 100px" />
          </template>
        </a-upload>
      </a-form-model-item>

      <a-form-model-item label="头像背景图">
        <a-upload
          listType="picture"
          name="file"
          :action="upUrl"
          :headers="headers"
          @change="imgChange"
        >
          <a-button style="margin-right:10px">
            <a-icon type="upload" />点击上传
          </a-button>

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
</template>
<script>
import { Url } from '../../plugin/http'

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
        icp_record: '',
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
      if (res.status !== 200) {
        if (res.status === 1004 || 1005 || 1006 || 1007) {
          window.sessionStorage.clear()
          this.$router.push('/login')
        }
        this.$message.error(res.message)
      }
      this.profileInfo = res.data
    },

    // 上传头像
    avatarChange(info) {
      if (info.file.status !== 'uploading') {
      }
      if (info.file.status === 'done') {
        this.$message.success(`图片上传成功`)
        const imgUrl = info.file.response.url
        this.profileInfo.avatar = imgUrl
      } else if (info.file.status === 'error') {
        this.$message.error(`图片上传失败`)
      }
    },

    // 上传头像背景图
    imgChange(info) {
      if (info.file.status !== 'uploading') {
      }
      if (info.file.status === 'done') {
        this.$message.success(`图片上传成功`)
        const imgUrl = info.file.response.url
        this.profileInfo.img = imgUrl
      } else if (info.file.status === 'error') {
        this.$message.error(`图片上传失败`)
      }
    },

    // 更新
    async updateProfile() {
      const { data: res } = await this.$http.put(`profile/${this.profileInfo.id}`, this.profileInfo)
      if (res.status !== 200) return this.$message.error(res.message)
      this.$message.success(`个人信息更新成功`)
      this.$router.push('/index')
    },
  },
}
</script>

<style scoped>
.upBtn {
  margin-right: 10px;
}
</style>