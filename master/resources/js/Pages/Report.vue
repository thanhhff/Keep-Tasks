<template>
    <app-layout :boards="boards">
        <div >
            <!-- Page Heading -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4" style="padding-top: 1rem; padding-right: 1rem">
                <br>
                <br>
                <a href="#" class="btn btn-sm btn-primary" style="background-color: #4e73df;"><i
                    class="fas fa-download fa-sm text-white-50"></i>Generate Report</a>
            </div>

            <!-- Content Row -->
            <div class="row">
                <!-- Content Column -->
                <div class="col-lg-6 mb-4">
                    <!-- Project Card Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
                        </div>
                        <div class="card-body">
                            <h4 class="small font-weight-bold">Backlog <span
                                class="float-right"> 2 / 10 </span></h4>
                            <div class="progress mb-4">
                                <div class="progress-bar" role="progressbar" style="width: 20%; background-color: #000000"
                                     aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <h4 class="small font-weight-bold">Todo <span
                                class="float-right"> 4 / 10 </span></h4>
                            <div class="progress mb-4">
                                <div class="progress-bar" role="progressbar" style="width: 40%; background-color: #31c48d"
                                     aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <h4 class="small font-weight-bold">Schedule <span
                                class="float-right"> 6 / 10 </span></h4>
                            <div class="progress mb-4">
                                <div class="progress-bar" role="progressbar" style="width: 60%; background-color: #76a9fa"
                                     aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <h4 class="small font-weight-bold">Delegate <span
                                class="float-right"> 8 / 10 </span></h4>
                            <div class="progress mb-4">
                                <div class="progress-bar" role="progressbar" style="width: 80%; background-color: #e3a008"
                                     aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <h4 class="small font-weight-bold"> Total <span
                                class="float-right"> 20 / 40 </span></h4>
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" style="width: 50%; background-color: #f98080"
                                     aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </app-layout>
</template>

<script>
import AppLayout from './../Layouts/AppLayout'
import BoardSide from "../components/board/BoardSide"
import BoardItemContainer from "../components/board/ItemContainer"
import ScheduleControls from "../components/schedule/controls";
import ScheduleView from "../components/schedule"
import Promodoro from "../components/promodoro/index"
import DialogModal from "../Jetstream/DialogModal"
import LinkFormModal from "../components/links/Form"
import LinkViewer from "../components/links/Viewer"
import PrimaryButton from "../Jetstream/Button"
import {subDays, toDate} from "date-fns";

export default {
    components: {
        AppLayout,
        BoardSide,
        BoardItemContainer,
        ScheduleView,
        Promodoro,
        DialogModal,
        LinkFormModal,
        LinkViewer,
        PrimaryButton,
        ScheduleControls
    },
    props: {
        boards: {
            type: Array,
            default() {
                return []
            }
        },
        todo: {
            type: [Array, Object],
            default() {
                return []
            }
        },
        scheduled: {
            type: [Array, Object],
            default() {
                return []
            }
        },
        date: {
            type: String,
            required: true
        },
        links: {
            type: Array,
            default() {
                return []
            }
        },
        committed: {
            type: [Array, Object],
            default() {
                return []
            }
        }
    },
    data() {
        return {
            modes: ['daily', 'weekly', 'monthly', 'quarter'],
            modeSelected: 'daily',
            promodoroColor: "red",
            localCommitDate: new Date,
            isLoading: false,
            isStandupOpen: false,
            isLinkFormOpen: false,
            linkData: {},
            tracker: null
        }
    },
    watch: {
        localCommitDate(newDate, oldDate) {
            if (oldDate && (newDate.toISOString().slice(0, 10) != oldDate.toISOString().slice(0, 10))) {
                this.getCommitsByDate();
            }
        },
    },
    computed: {
        hasCommited() {
            return this.todo.filter(item => item.done).length;
        },
        showTodo() {
            return ['all', 'todos'].includes(this.modeSelected)
        },
        showCommitted() {
            return ['all', 'committed'].includes(this.modeSelected)
        }
    },
    created() {
        this.setCommitDate()
    },
    methods: {
        setCommitDate() {
            let date = new Date();
            if (this.date) {
                date = this.date.split("-");
                date = toDate(new Date(date[0], date[1] - 1, date[2]));
            }
            this.localCommitDate = date;
        },

        completeDay() {
            this.isLoading = true;
            const yesterday = subDays(new Date(), 1)
                .toISOString()
                .slice(0, 10);
            const now = new Date().toISOString().slice(0, 10);
            let completed = this.todo.filter(item => item.done);
            completed = completed.map(item => {
                item.commit_date = yesterday;
                return item;
            });

            completed.forEach(async item => {
                await this.updateItem(item);
            });

            this.updateDayly(now)
            this.isStandupOpen = false;
            this.isLoading = false;
            this.$inertia.reload({preserveScroll: true})
        },

        getCommitsByDate() {
            const params = `?commit-date=${this.localCommitDate.toISOString().slice(0, 10)}`
            this.$inertia.replace(`/${params}`,
                {
                    only: ['committed'],
                    preserveState: true
                })
        },

        updateItem(item) {
            const method = item.id ? 'PUT' : 'POST';
            const param = item.id ? `/${item.id}` : ''
            axios({
                url: `/items${param}`,
                method,
                data: item
            }).then(() => {
                this.$inertia.reload({
                    preserveScroll: true
                });
                return true;
            })
        },

        updateDayly(date) {
            axios({
                url: 'standups',
                method: 'post',
                data: {
                    date
                }
            })
        },

        closeLinkForm() {
            this.linkData = {};
            this.isLinkFormOpen = false
        },

        openLinkForm(formData) {
            this.linkData = formData;
            this.isLinkFormOpen = true
        },

        onLinkSaved() {
            this.closeLinkForm();
            this.$inertia.reload({
                preserveScroll: true
            })
        },

        setTaskToTimer(task) {
            this.$refs.Promodoro.setTask(task);
        }
    }
}
</script>

<style lang="scss">

//Update
//@import url("https://startbootstrap.github.io/startbootstrap-sb-admin-2/css/sb-admin-2.min.css");
.card-header {
    padding: 0.75rem 1.25rem;
    margin-bottom: 0;
    background-color: #f8f9fc;
    border-bottom: 1px solid #e3e6f0;
}

.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1.25rem;
}

@-webkit-keyframes progress-bar-stripes {
    from {
        background-position: 1rem 0;
    }
    to {
        background-position: 0 0;
    }
}

@keyframes progress-bar-stripes {
    from {
        background-position: 1rem 0;
    }
    to {
        background-position: 0 0;
    }
}

.progress {
    display: flex;
    height: 1rem;
    overflow: hidden;
    line-height: 0;
    font-size: 0.75rem;
    background-color: #eaecf4;
    border-radius: 0.35rem;
}

.progress-bar {
    display: flex;
    flex-direction: column;
    justify-content: center;
    overflow: hidden;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    background-color: #4e73df;
    transition: width 0.6s ease;
}

@media (prefers-reduced-motion: reduce) {
    .progress-bar {
        transition: none;
    }
}

.progress-bar-striped {
    background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
    background-size: 1rem 1rem;
}

.progress-bar-animated {
    -webkit-animation: progress-bar-stripes 1s linear infinite;
    animation: progress-bar-stripes 1s linear infinite;
}

@media (prefers-reduced-motion: reduce) {
    .progress-bar-animated {
        -webkit-animation: none;
        animation: none;
    }
}

.d-sm-flex {
    display: flex !important;
}

.align-items-center {
    align-items: center !important;
}

.justify-content-between {
    justify-content: space-between !important;
}

.mb-4,
.my-4 {
    margin-bottom: 1.5rem !important;
}

.col-1, .col-2, .col-3, .col-4, .col-5, .col-6, .col-7, .col-8, .col-9, .col-10, .col-11, .col-12, .col,
.col-auto, .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm,
.col-sm-auto, .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12, .col-md,
.col-md-auto, .col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg,
.col-lg-auto, .col-xl-1, .col-xl-2, .col-xl-3, .col-xl-4, .col-xl-5, .col-xl-6, .col-xl-7, .col-xl-8, .col-xl-9, .col-xl-10, .col-xl-11, .col-xl-12, .col-xl,
.col-xl-auto {
    position: relative;
    width: 100%;
    padding-right: 0.75rem;
    padding-left: 0.75rem;
}

.card {
    //position: relative;
    //display: flex;
    //flex-direction: column;
    //min-width: 0;
    //word-wrap: break-word;
    //background-color: #fff;
    //background-clip: border-box;
    ////border: 1px solid #e3e6f0;
    //border-radius: 0.35rem;
}

.shadow {
    box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15) !important;
}

.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1.25rem;
}

.chart-area {
    position: relative;
    height: 10rem;
    width: 100%;
}


.chart-area {
    position: relative;
    height: 10rem;
    width: 100%;
}

@media (min-width: 768px) {
    .chart-area {
        height: 20rem;
    }
}

.chart-bar {
    position: relative;
    height: 10rem;
    width: 100%;
}

@media (min-width: 768px) {
    .chart-bar {
        height: 20rem;
    }
}

.chart-pie {
    position: relative;
    height: 15rem;
    width: 100%;
}

@media (min-width: 768px) {
    .chart-pie {
        height: calc(20rem - 43px) !important;
    }
}

//Update

.section-card {
    @apply bg-white overflow-hidden shadow-xl mx-2 mb-4;
    &.margin-0 {
        @apply m-0;
    }

    header {
        @apply p-4;
    }

    .body {
        @apply p-4;
        min-height: 5rem;
    }

    .body.p-0 {
        @apply p-0;
    }
}

button {
    &:focus {
        outline: 0 !important;
    }
}
</style>

