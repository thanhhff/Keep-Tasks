<template>
    <app-layout :boards="boards">
        <div class="">
            <div class="section-card committed mt-5">
                <header
                    class="bg-blue-400 text-white font-bold flex justify-between"
                >
                            <span>
                                Notes
                            </span>
                    <button
                        class="bg-transparent text-white"
                        @click="isNoteFormOpen = !isNoteFormOpen"
                    >
                        <i class="fa fa-plus"></i>
                    </button>
                </header>
                <div class="body text-gray-600">

                    <note-viewer
                        :notes="notes"
                        @edit="openNoteForm"
                    ></note-viewer>

                </div>
            </div>

            <note-form-modal
                :record-data="noteData"
                :is-open="isNoteFormOpen"
                @saved="onNoteSaved"
                @cancel="isNoteFormOpen = false"
            >
            </note-form-modal>
        </div>
    </app-layout>
</template>

<script>
import AppLayout from "./../Layouts/AppLayout";
import BoardSide from "../components/board/BoardSide";
import BoardItemContainer from "../components/board/ItemContainer";
import ScheduleControls from "../components/schedule/controls";
import ScheduleView from "../components/schedule";
import NoteFormModal from "../components/notes/Form";
import NoteViewer from "../components/notes/ViewerBig";
import PrimaryButton from "../Jetstream/Button";
import {subDays, toDate} from "date-fns";
import {uniq, orderBy} from "lodash-es";

export default {
    components: {
        AppLayout,
        BoardSide,
        BoardItemContainer,
        ScheduleView,
        NoteFormModal,
        NoteViewer,
        PrimaryButton,
        ScheduleControls
    },
    props: {
        boards: {
            type: Array,
            default() {
                return [];
            }
        },
        todo: {
            type: [Array, Object],
            default() {
                return [];
            }
        },
        scheduled: {
            type: [Array, Object],
            default() {
                return [];
            }
        },
        commitDate: {
            type: String,
            required: true
        },
        standup: {
            type: Array,
            default() {
                return [];
            }
        },
        links: {
            type: Array,
            default() {
                return [];
            }
        },
        notes: {
            type: Array,
            default() {
                return [];
            }
        },
        committed: {
            type: [Array, Object],
            default() {
                return [];
            }
        }
    },
    data() {
        return {
            modes: ["inbox", "committed", "all"],
            selectedStage: "",
            modeSelected: "inbox",
            promodoroColor: "red",
            localCommitDate: new Date(),
            isLoading: false,
            isStandupOpen: false,
            isLinkFormOpen: false,
            linkData: {},
            isNoteFormOpen: false,
            noteData: {},
            tracker: null
        };
    },
    watch: {
        localCommitDate(newDate, oldDate) {
            if (
                oldDate &&
                newDate.toISOString().slice(0, 10) !=
                oldDate.toISOString().slice(0, 10)
            ) {
                this.getCommitsByDate();
            }
        }
    },
    computed: {
        hasCommited() {
            return this.todo.filter(item => item.done).length;
        },
        showTodo() {
            return ["all", "inbox"].includes(this.modeSelected);
        },
        showCommitted() {
            return ["all", "committed"].includes(this.modeSelected);
        },
        stages() {
            return uniq(this.todo.map(item => item.stage));
        },
        inbox() {
            const inbox = this.selectedStage
                ? this.todo.filter(item => item.stage == this.selectedStage)
                : this.todo;
            return orderBy(this.todo, ["priority", "stage", "title"]);
        }
    },
    mounted() {
        if (!this.standup.length) {
            this.isStandupOpen = true;
        }
    },
    created() {
        this.setCommitDate();
    },
    methods: {
        setCommitDate() {
            let date = new Date();
            if (this.commitDate) {
                date = this.commitDate.split("-");
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

            this.updateDayly(now);
            this.isStandupOpen = false;
            this.isLoading = false;
            this.$inertia.reload({preserveScroll: true});
        },

        getCommitsByDate() {
            const params = `?commit-date=${this.localCommitDate
                .toISOString()
                .slice(0, 10)}`;
            this.$inertia.replace(`/${params}`, {
                only: ["committed"],
                preserveState: true
            });
        },

        updateItem(item) {
            const method = item.id ? "PUT" : "POST";
            const param = item.id ? `/${item.id}` : "";
            axios({
                url: `/items${param}`,
                method,
                data: item
            }).then(() => {
                this.$inertia.reload({
                    preserveScroll: true
                });
                return true;
            });
        },

        updateDayly(date) {
            axios({
                url: "standups",
                method: "post",
                data: {
                    date
                }
            });
        },

        closeLinkForm() {
            this.linkData = {};
            this.isLinkFormOpen = false;
        },

        openLinkForm(formData) {
            this.linkData = formData;
            this.isLinkFormOpen = true;
        },

        onLinkSaved() {
            this.closeLinkForm();
            this.$inertia.reload({
                preserveScroll: true
            });
        },

        closeNoteForm() {
            this.noteData = {};
            this.isNoteFormOpen = false;
        },

        openNoteForm(formData) {
            this.noteData = formData;
            this.isNoteFormOpen = true;
        },

        onNoteSaved() {
            this.closeNoteForm();
            this.$inertia.reload({
                preserveScroll: true
            });
        },

        setTaskToTimer(task) {
            this.$refs.Promodoro.setTask(task);
        }
    }
};
</script>

<style lang="scss">
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
